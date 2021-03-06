// ----------------------------------------------------------------------------
//                            The ZAP Project
//                     (C)2016-2017, Revanth Kamaraj.     
// ----------------------------------------------------------------------------
// Filename     : zap_cp15_cb.v
// HDL          : Verilog-2001
// Module       : zap_cp15_cb       
// Author       : Revanth Kamaraj
// License      : GPL v2
// ----------------------------------------------------------------------------
//                               ABSTRACT
//                               --------
// Description --
// This RTL describes the CP15 register block. The ports go to the MMU and
// cache unit. This block connects to the CPU core. Coprocessor operations
// supported are read from coprocessor and write to CPU registers or vice
// versa. This is integrated within the processor. The MMU unit can easily be
// interfaced with this block.
// ----------------------------------------------------------------------------
//                              INFORMATION                                  
//                              ------------
// Reset method : Synchronous active high reset
// Clock        : Core clock
// Depends      : --
// ----------------------------------------------------------------------------

`default_nettype none

module zap_cp15_cb #(
        parameter PHY_REGS = 64
)
(
        // Clock and reset.
        input wire                              i_clk,
        input wire                              i_reset,

        //
        // Coprocessor bus.
        //

        // Coprocessor instruction.
        input wire      [31:0]                  i_cp_word,

        // Coprocessor instruction valid.
        input wire                              i_cp_dav,

        // Coprocessor done.
        output reg                              o_cp_done,

        // CPSR from processor.
        input  wire     [31:0]                  i_cpsr,

        // Asserted if we want to control of the register file.
        // Controls a MUX that selects signals.
        output reg                              o_reg_en,

        // Data to write to the register file.
        output reg [31:0]                       o_reg_wr_data,

        // Data read from the register file.
        input wire [31:0]                       i_reg_rd_data,

        // Write and read index for the register file.
        output reg [$clog2(PHY_REGS)-1:0]       o_reg_wr_index,
                                                o_reg_rd_index,

        //
        // From MMU.
        //

        // The FSR stands for "Fault Status Register"
        // The FAR stands for "Fault Address Register"
        input wire      [31:0]                  i_fsr,
        input wire      [31:0]                  i_far,

        //
        // These go to the MMU
        //

        // COMMON TO BOTH DATA AND CODE MMU.

        // Domain Access Control Register.
        output reg      [31:0]                  o_dac,

        // Base address of page table.
        output reg      [31:0]                  o_baddr,

        // MMU enable.
        output reg                              o_mmu_en,

        // SR register.
        output reg      [1:0]                   o_sr,

        // SEPARATE SIGNALS FOR DATA AND CODE MMU.

        // Cache invalidate signal.
        output reg                              o_dcache_inv,
        output reg                              o_icache_inv,

        // Cache clean signal.
        output reg                              o_dcache_clean,
        output reg                              o_icache_clean,

        // TLB invalidate signal - single cycle.
        output reg                              o_dtlb_inv,
        output reg                              o_itlb_inv,

        // Cache enable.
        output reg                              o_dcache_en,
        output reg                              o_icache_en,

        // From MMU. Specify that cache invalidation is done.
        input   wire                            i_dcache_inv_done,
        input   wire                            i_icache_inv_done,

        // From MMU. Specify that cache clean is done.
        input   wire                            i_dcache_clean_done,
        input   wire                            i_icache_clean_done
);

`include "zap_localparams.vh"
`include "zap_defines.vh"
`include "zap_functions.vh"


reg [31:0] r [6:0]; // Coprocessor registers. R7 is write-only.
reg [3:0]    state; // State variable.

`ifdef SIM
integer ops;
initial ops = 0;
`endif

//
// This block ties the registers to the
// output ports.
//
always @*
begin
        o_dcache_en = r[1][2];                  // Data cache enable.
        o_icache_en = r[1][12];                 // Instruction cache enable.
        o_mmu_en    = r[1][0];                  // MMU enable.
        o_dac       = r[3];                     // DAC register.
        o_baddr    = r[2];                      // Base address.               
        o_sr       = {r[1][8],r[1][9]};         // SR register.        

        // Debug only.
        `ifdef SIM
                `ifdef FORCE_DCACHE_EN
                        o_dcache_en = 1'd1;
                `endif

                `ifdef FORCE_ICACHE_EN
                        o_icache_en = 1'd1;
                `endif

                `ifdef FORCE_MMU_EN
                        o_mmu_en = 1'd1;
                `endif
        `endif
end

// States.
localparam IDLE                 = 0;
localparam ACTIVE               = 1;
localparam DONE                 = 2;
localparam READ                 = 3;
localparam READ_DLY             = 4;
localparam TERM                 = 5;
localparam CLR_D_CACHE_AND      = 6;
localparam CLR_D_CACHE          = 7;
localparam CLR_I_CACHE          = 8;
localparam CLEAN_D_CACHE        = 9;
localparam CLEAN_ID_CACHE       = 10;
localparam CLFLUSH_ID_CACHE     = 11;
localparam CLFLUSH_D_CACHE      = 12;

// Register numbers.
localparam FSR_REG              = 5;
localparam FAR_REG              = 6;
localparam CACHE_REG            = 7;
localparam TLB_REG              = 8;

//{opcode_2, crm} values that are valid for this implementation.
localparam CASE_FLUSH_ID_CACHE       = 7'b000_0111;
localparam CASE_FLUSH_I_CACHE        = 7'b000_0101;
localparam CASE_FLUSH_D_CACHE        = 7'b000_0110;
localparam CASE_CLEAN_ID_CACHE       = 7'b000_1011;
localparam CASE_CLEAN_D_CACHE        = 7'b000_1010;
localparam CASE_CLFLUSH_ID_CACHE     = 7'b000_1111;
localparam CASE_CLFLUSH_D_CACHE      = 7'b000_1110;
localparam CASE_FLUSH_ID_TLB         = 7'b000_0111;
localparam CASE_FLUSH_I_TLB          = 7'b000_0101;
localparam CASE_FLUSH_D_TLB          = 7'b000_0110;

// Instruction fields.
`define opcode_2        7:5        
`define crm             3:0
`define crn             19:16
`define cp_id           11:8

always @ (posedge i_clk)
begin
        if ( i_reset )
        begin
                state          <= IDLE;
                r[0]           <= 32'h1; // ID register reads -1.
                o_dcache_inv   <= 1'd0;
                o_icache_inv   <= 1'd0;
                o_dcache_clean <= 1'd0;
                o_icache_clean <= 1'd0;
                o_dtlb_inv     <= 1'd0;
                o_itlb_inv     <= 1'd0;
                o_reg_en       <= 1'd0;
                o_cp_done      <= 1'd0;
                o_reg_wr_data  <= 0;
                o_reg_wr_index <= 0;
                o_reg_rd_index <= 0;
                r[1]           <= 32'd0;
                r[2]           <= 32'd0;
                r[3]           <= 32'd0;
                r[4]           <= 32'd0;
                r[5]           <= 32'd0;
                r[6]           <= 32'd0;

`ifdef SIM
                ops             <= 0;
`endif
        end
        else
        begin
`ifdef SIM
                ops             <= 0;
`endif

                r[0]            <= 32'h1;
                r[1][1]         <= 1'd1;
                r[1][3]         <= 1'd0;
                r[1][7:4]       <= 4'b1111;
                r[1][11]        <= 1'd1;                
                r[1][13]        <= 1'd0;

                o_itlb_inv       <= 1'd0;
                o_dtlb_inv      <= 1'd0;
                o_dcache_inv    <= 1'd0;
                o_icache_inv    <= 1'd0;
                o_icache_clean  <= 1'd0;
                o_dcache_clean  <= 1'd0;
                o_reg_en        <= 1'd0;
                o_cp_done       <= 1'd0;
        
                case ( state )
                IDLE: // Idle state.
                begin
                        o_cp_done <= 1'd0;
        
                        // Keep monitoring FSR and FAR from MMU unit. If
                        // produced, clock them in.
                        if ( i_fsr[3:0] != 4'd0 )
                        begin
                                r[FSR_REG] <= i_fsr;
                                r[FAR_REG] <= i_far;
                        end
       
                        // Coprocessor instruction. 
                        if ( i_cp_dav && i_cp_word[`cp_id] == 15 )
                        begin
                                if ( i_cpsr[4:0] != USR )
                                begin
                                        // ACTIVATE this block.
                                        state     <= ACTIVE;
                                        o_cp_done <= 1'd0;
                                end
                                else
                                begin
                                        // No permissions in USR land. 
                                        // Pretend to be done and go ahead.
                                        o_cp_done <= 1'd1;
                                end
                        end
                end
        
                DONE: // Complete transaction.
                begin
                        // Tell that we are done.
                        o_cp_done    <= 1'd1;
                        state        <= TERM;
                end
        
                TERM: // Wait state before going to IDLE.
                begin
                        state <= IDLE;
                end
        
                READ_DLY: // Register data is clocked out in this stage.
                begin
                        state <= READ;
                end
        
                READ: // Write value read from CPU register to coprocessor.
                begin
                        state <= DONE;

                        r [ i_cp_word[`crn] ] <= i_reg_rd_data;
        
                        if (    
                                i_cp_word[`crn] == TLB_REG  // TLB control.
                        )
                        begin
                                case({i_cp_word[`opcode_2], i_cp_word[`crm]})

                                        CASE_FLUSH_ID_TLB:
                                        begin
`ifdef SIM
                                                ops <= 1;
`endif
                                                o_itlb_inv  <= 1'd1;
                                                o_dtlb_inv  <= 1'd1;
                                        end

                                        CASE_FLUSH_I_TLB:
                                        begin
`ifdef SIM
                                                ops <= 2;
`endif
                                                o_itlb_inv <= 1'd1;
                                        end

                                        CASE_FLUSH_D_TLB:  
                                        begin
`ifdef SIM
                                                ops <= 3;
`endif
                                                o_dtlb_inv <= 1'd1;
                                        end                                                        

                                        default:
                                        begin
                                                $display("Bad TLB command!");
                                                $finish;
                                        end

                                endcase
                        end
                        else if ( i_cp_word[`crn] == CACHE_REG ) // Cache control.
                        begin
                                case({i_cp_word[`opcode_2], i_cp_word[`crm]})
                                        CASE_FLUSH_ID_CACHE:
                                        begin
`ifdef SIM
                                                ops <= 4;
`endif
                                                // Invalidate caches.
                                                o_dcache_inv    <= 1'd1;
                                                state           <= CLR_D_CACHE_AND;
                                        end

                                        CASE_FLUSH_D_CACHE:
                                        begin
`ifdef SIM
                                                ops <= 5;
`endif

                                                // Invalidate data cache.
                                                o_dcache_inv    <= 1'd1;
                                                state           <= CLR_D_CACHE;
                                        end

                                        CASE_FLUSH_I_CACHE:
                                        begin
`ifdef SIM
                                                ops <= 6;
`endif

                                                // Invalidate instruction cache.
                                                o_icache_inv    <= 1'd1;
                                                state           <= CLR_I_CACHE;
                                        end

                                        CASE_CLEAN_ID_CACHE, CASE_CLEAN_D_CACHE:
                                        begin
`ifdef SIM
                                                ops <= 7;
`endif

                                                o_dcache_clean <= 1'd1;
                                                state          <= CLEAN_D_CACHE;
                                        end

                                        CASE_CLFLUSH_D_CACHE:
                                        begin
`ifdef SIM
                                                ops <= 8;
`endif

                                                o_dcache_clean <= 1'd1;
                                                state          <= CLFLUSH_D_CACHE;
                                        end

                                        CASE_CLFLUSH_ID_CACHE,CASE_CLFLUSH_D_CACHE:
                                        begin
`ifdef SIM
                                                ops <= 9;
`endif

                                                o_dcache_clean <= 1'd1;
                                                state          <= CLFLUSH_ID_CACHE;
                                        end

                                        default:
                                        begin
                                        $display($time, "WARNING: Bad coprocessor instruction %b", i_cp_word);
                                        $finish;
                                        end

                                endcase
                        end
                end

                // States.
                CLEAN_D_CACHE, 
                CLFLUSH_ID_CACHE, 
                CLFLUSH_D_CACHE:
                begin
                        o_dcache_clean <= 1'd1;

                        if ( i_dcache_clean_done )
                        begin
                                o_dcache_clean <= 1'd0;        

                                if ( state == CLFLUSH_D_CACHE )
                                begin
                                        o_dcache_inv    <= 1'd1;
                                        state           <= CLR_D_CACHE;
                                end
                                else if ( state == CLFLUSH_ID_CACHE )
                                begin
                                        o_dcache_inv    <= 1'd1;
                                        state           <= CLR_D_CACHE_AND;
                                end
                                else // CLEAN_D_CACHE
                                begin
                                        state <= DONE;
                                end
                        end
                end

                CLR_D_CACHE, CLR_D_CACHE_AND: // Clear data cache.
                begin
                        o_dcache_inv <= 1'd1;

                        // Wait for cache invalidation to complete.
                        if ( i_dcache_inv_done && state == CLR_D_CACHE )
                        begin
                                o_dcache_inv <= 1'd0;
                                state <= DONE;
                        end
                        else if ( state == CLR_D_CACHE_AND && i_dcache_inv_done ) 
                        begin
                                o_dcache_inv <= 1'd0;
                                o_icache_inv <= 1'd1;
                                state <= CLR_I_CACHE;
                        end
                end       

                CLR_I_CACHE: // Clear instruction cache.
                begin
                        o_icache_inv <= 1'd1;

                        if ( i_icache_inv_done )
                        begin
                                o_icache_inv <= 1'd0;
                                state <= DONE;                                                
                        end
                end

                ACTIVE: // Access processor registers.
                begin
                        if ( is_cc_satisfied ( i_cp_word[31:28], i_cpsr[31:28] ) )
                        begin
                                        if ( i_cp_word[20] ) // Load to CPU reg.
                                        begin
                                                // Register write command.
                                                o_reg_en        <= 1'd1;
                                                o_reg_wr_index  <= translate( i_cp_word[15:12], i_cpsr[4:0] ); 
                                                o_reg_wr_data   <= r[ i_cp_word[19:16] ];
                                                state           <= DONE;
                                        end
                                        else // Store to CPU register.
                                        begin
                                                // Generate register read command.
                                                o_reg_en        <= 1'd1;
                                                o_reg_rd_index  <= translate(i_cp_word[15:12], i_cpsr[4:0]);
                                                o_reg_wr_index  <= 16;
                                                state           <= READ_DLY;                                        
                                        end
                        end
                        else
                        begin
                                state        <= DONE;
                        end
                end
                endcase
        end
end

`ifdef SIM
// Debug only.
wire [31:0] r0 = r[0];
wire [31:0] r1 = r[1];
wire [31:0] r2 = r[2];
wire [31:0] r3 = r[3];
wire [31:0] r4 = r[4];
wire [31:0] r5 = r[5];
wire [31:0] r6 = r[6];
`endif

endmodule
