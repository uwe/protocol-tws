package Protocol::TWS::Request::cancelFundamentalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 53 }

sub meta {
    return (
        reqId => 'tickerId',
    );
}

1;

