#!/usr/bin/env perl
use 5.010;
use strict;
use warnings;

use Pod::Html;
use autodie;
use FindBin;

my $output_dir = shift(@ARGV) // '.';

my $input_dir = "$FindBin::Bin/documentation";
chdir $input_dir;

my @docs = map substr($_, 0, -4), glob '*.pod';

for my $pod (@docs) {
    pod2html(
        "--infile=$pod.pod",
        "--outfile=$output_dir/$pod.html",
        "--podroot=/$input_dir",
        "--htmlroot=/",
#        "--libpods=" . join(':', @docs),
        "--css=/style.css",
        "--htmldir=$output_dir",
    );
}
