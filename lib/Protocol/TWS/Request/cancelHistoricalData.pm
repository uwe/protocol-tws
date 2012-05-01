package Protocol::TWS::Request::cancelHistoricalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 25 }

sub meta {
    return (
        tickerId => 'tickerId',
    );
}

1;

