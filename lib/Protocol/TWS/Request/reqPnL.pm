package Protocol::TWS::Request::reqPnL;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 92 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        account   => {},
        modelCode => {},
    );
}

sub _version { undef }

sub _response {
    return (
        pnl => 'cont',
    );
}

1;
