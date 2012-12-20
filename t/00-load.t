#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'Net::SNMP::Poller' ) || print "Bail out!\n";
}

diag( "Testing Net::SNMP::Poller $Net::SNMP::Poller::VERSION, Perl $], $^X" );

my $obj = Net::SNMP::Poller->new();
isa_ok( $obj, 'Net::SNMP::Poller' );

my $ref = {
    'localhost' => {
        community => 'public',
        version   => 1,
        varbindlist => [ '.1.3.6.1.4.1.2021.11.50.0' ],
    },
    '127.0.0.1' => { # purposely reusing localhost as 127.0.0.1
        varbindlist => [ '.1.3.6.1.4.1.2021.11.54.0' ],
    }
};

my $data = $obj->run( $ref );
isa_ok( $data, 'HASH' );

done_testing();
