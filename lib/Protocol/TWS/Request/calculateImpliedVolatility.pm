package Protocol::TWS::Request::calculateImpliedVolatility;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 54 }

sub _meta {
    return (
        reqId       => 'tickerId',
        contract    => 'Contract',
        optionPrice => 'double',
        underPrice  => 'double',
    );
}

1;

