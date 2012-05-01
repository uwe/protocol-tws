package Protocol::TWS::Response::tickOptionComputation;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 21 }

sub meta {
    return (
        id         => 'tickerId',
        tickType   => 'tickType',
        impliedVol => 'double',
        delta      => 'double',
        optPrice   => 'double',
        pvDividend => 'double',
        gamma      => 'double',
        vega       => 'double',
        theta      => 'double',
        undPrice   => 'double',
    );
}

1;

