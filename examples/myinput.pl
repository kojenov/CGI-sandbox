#!/usr/bin/perl

print "Content-type: text/html\n\n";
print "<pre>";

$argc = $#ARGV + 1;
print "Number of command line arguments: $argc\n";

foreach $i (0 .. $#ARGV) {
    print "$i: '$ARGV[$i]'\n";
}

print "\nEnvironment variables:\n";

foreach $var (sort keys(%ENV)) {
  print "$var=$ENV{$var}\n";
}

print "</pre>";
