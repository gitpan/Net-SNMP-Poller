#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'Net::SNMP::Poller' ) || print "Bail out!\n";
}

diag( "Testing Net::SNMP::Poller $Net::SNMP::Poller::VERSION, Perl $], $^X" );
done_testing();