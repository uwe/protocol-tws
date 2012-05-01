package Protocol::TWS::Request::cancelCalculateOptionPrice;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 57 }

sub meta {
    return (
        reqId => 'tickerId',
    );
}

1;

