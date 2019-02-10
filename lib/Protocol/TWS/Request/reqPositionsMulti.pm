package Protocol::TWS::Request::reqPositionsMulti;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 74 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        account   => {},
        modelCode => {},
    );
}

sub _response {
    return (
        positionMulti    => 'cont',
        positionMultiEnd => 'end',
    );
}

1;
