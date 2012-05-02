package Protocol::TWS::Request::cancelCalculateOptionPrice;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 57 }

sub _meta {
    return (
        reqId => 'tickerId',
    );
}

1;

