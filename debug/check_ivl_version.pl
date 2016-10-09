#!/usr/bin/perl

use strict;
use warnings;

my $x = `iverilog -V`;

if ( $x !~ m/^Icarus Verilog version 10.0 \(stable\) \(v10_0\)\n/ )
{
        print "*W: ZAP has been tested with Icarus Verilog 10.0 set to Verilog-2001 mode. Running on other versions of the compiler in other modes MAY result in differing behavior.\n"        ;
        print "*W: Press a key to continue running the simulation...";
        my $NULL = <STDIN>;
}
else
{
        print "*I: Compiler version check passed!\n";
}
