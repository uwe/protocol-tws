package Protocol::TWS::Request::reqMatchingSymbols;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 81 }

sub _meta {
    return (
        id      => {alias => 'reqId'},
        pattern => {},
    );
}

sub _version { undef }

sub _response {
    return (
        symbolSamples => 'single',
    );
}

1;
