package Protocol::TWS;

use strict;
use warnings;

use Module::Find ();

my @STRUCTS   = Module::Find::useall('Protocol::TWS::Struct');
my @REQUESTS  = Module::Find::useall('Protocol::TWS::Request');
my @RESPONSES = Module::Find::useall('Protocol::TWS::Response');

my %REQUEST_ID  = map { $_->id => $_ } @REQUESTS;
my %RESPONSE_ID = map { $_->id => $_ } @RESPONSES;


sub response_by_id {
    my ($class, $id) = @_;
    return $RESPONSE_ID{$id};
}

1;
