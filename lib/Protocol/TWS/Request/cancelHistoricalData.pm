package Protocol::TWS::Request::cancelHistoricalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 25 }

sub _meta {
    return (
        id => {alias => 'tickerId'},
    );
}

1;

