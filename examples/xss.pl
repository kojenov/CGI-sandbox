#!/usr/bin/perl
use CGI;
my $q = CGI->new;
print $q->header();
print "<html><body>" . $q->param('payload') . "</body></html>";
