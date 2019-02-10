package Protocol::TWS::Request::reqPnLSingle;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 94 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        account   => {},
        modelCode => {},
        conId     => 'int',
    );
}

sub _version { undef }

sub _response {
    return (
        pnlSingle => 'cont',
    );
}

1;
