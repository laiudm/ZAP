#!/usr/bin/perl

while(<>)
{
        if ( $_  =~ m/`define\s+MEMORY_IMAGE\s+(.*?)\s*$/ )
        {
                print "$1\n";
                exit;
        }
}

print STDERR "*E: Check config.vh syntax!";
exit;
