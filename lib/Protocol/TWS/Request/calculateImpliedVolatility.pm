package Protocol::TWS::Request::calculateImpliedVolatility;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 54 }

sub meta {
    return (
        reqId       => 'tickerId',
        contract    => 'Contract',
        optionPrice => 'double',
        underPrice  => 'double',
    );
}

1;

