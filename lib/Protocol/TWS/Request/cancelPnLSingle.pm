package Protocol::TWS::Request::cancelPnLSingle;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 95 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

sub _version { undef }

sub _response {}

1;
