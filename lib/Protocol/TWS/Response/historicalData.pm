package Protocol::TWS::Response::historicalData;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 17 }

sub meta {
    return (
        reqId    => 'tickerId',
        date     => {},
        open     => 'double',
        high     => 'double',
        low      => 'double',
        close    => 'double',
        volume   => 'int',
        barCount => 'int',
        WAP      => 'double',
        hasGaps  => 'int',
    );
}

1;

