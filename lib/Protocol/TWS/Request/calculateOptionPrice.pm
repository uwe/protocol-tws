package Protocol::TWS::Request::calculateOptionPrice;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 55 }

sub _meta {
    return (
        reqId      => 'tickerId',
        contract   => 'Contract',
        volatility => 'double',
        underPrice => 'double',
    );
}

1;

