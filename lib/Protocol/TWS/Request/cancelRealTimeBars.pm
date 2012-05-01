package Protocol::TWS::Request::cancelRealTimeBars;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 51 }

sub meta {
    return (
        tickerId => 'tickerId',
    );
}

1;

