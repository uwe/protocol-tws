package Protocol::TWS::Response::marketDataType;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 58 }

sub _meta {
    return (
        id             => {alias => 'reqId'},
        marketDataType => 'int',
    );
}

1;

