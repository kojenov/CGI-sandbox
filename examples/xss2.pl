#!/usr/bin/perl
use CGI;
my $q = CGI->new;
open(my $f, '>', '/var/www/html/xss2data.html');
print $f "<html><body>" . $q->param('payload') . "</body></html>";
close $f;
print $q->header();
print '<html><body>Thank you. Click <a href="/xss2data.html">here</a> to view the data.</body></html>';
