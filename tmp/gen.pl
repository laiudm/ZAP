# Script to generate register view assign statements.

for($i=0;$i<46;$i++)
{
        print "wire [31:0] r$i; assign r$i = u_zap_top.u_zap_regf.r_ff[$i]\n";
}
