#!/usr/bin/tcsh

# The fastest way to get up and running with this.
# Simply source this.

rm -f a.out log.log zap.vcd
date > log.log
source ../scripts/source_it
perl ../scripts/do_it.pl ../sw/asm/prog.s ../sw/c/prog.c ../scripts/linker.ld ../tmp/prog.bin prog.v
iverilog -f files.list ../testbench/*.v -DSIM
./a.out >> log.log

