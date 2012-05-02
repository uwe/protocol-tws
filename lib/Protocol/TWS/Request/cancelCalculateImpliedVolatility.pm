package Protocol::TWS::Request::cancelCalculateImpliedVolatility;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 56 }

sub _meta {
    return (
        reqId => 'tickerId',
    );
}

1;

