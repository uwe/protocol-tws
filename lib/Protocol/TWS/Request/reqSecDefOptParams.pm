package Protocol::TWS::Request::reqSecDefOptParams;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 78 }

sub _meta {
    return (
        id                => {alias => 'reqId'},
        underlyingSymbol  => {},
        futFopExchange    => {},
        underlyingSecType => {},
        underlyingConId   => 'int',
    );
}

sub _version { undef }

sub _response {
    return (
        securityDefinitionOptionParameter => 'single',
    );
}

1;
