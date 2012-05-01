package Protocol::TWS::Request::calculateOptionPrice;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 55 }

sub meta {
    return (
        reqId      => 'tickerId',
        contract   => 'Contract',
        volatility => 'double',
        underPrice => 'double',
    );
}

1;

