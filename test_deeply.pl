#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Net::SNMP::Poller;

my $obj = Net::SNMP::Poller->new();
isa_ok( $obj, 'Net::SNMP::Poller' );

my $ref = {
    'localhost' => {
        community => 'public',
        version   => 1,
        varbindlist => [ '.1.3.6.1.4.1.2021.11.50.0' ],
    },
    '127.0.0.1' => { # purposely reusing localhost as a different host
        varbindlist => [ '.1.3.6.1.4.1.2021.11.54.0' ],
    }
};

my $data = $obj->run( $ref );
isa_ok( $data, 'HASH' );
#print Dumper($data);

done_testing();