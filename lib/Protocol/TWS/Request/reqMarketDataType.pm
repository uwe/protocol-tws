package Protocol::TWS::Request::reqMarketDataType;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 59 }

sub _meta {
    return (
        marketDataType => 'int',
    );
}

sub _response {
    return (
        marketDataType => 'single',
    );
}

1;

