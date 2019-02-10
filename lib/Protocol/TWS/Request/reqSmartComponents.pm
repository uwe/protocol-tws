package Protocol::TWS::Request::reqSmartComponents;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 83 }

sub _meta {
    return (
        id          => {alias => 'reqId'},
        bboExchange => {},
    );
}

sub _version { undef }

sub _response {
    return (
        smartComponents => 'single',
    );
}

1;
