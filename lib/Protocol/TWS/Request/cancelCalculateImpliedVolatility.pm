package Protocol::TWS::Request::cancelCalculateImpliedVolatility;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 56 }

sub meta {
    return (
        reqId => 'tickerId',
    );
}

1;

