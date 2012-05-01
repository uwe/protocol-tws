package Protocol::TWS::Response::tickEFP;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 47 }

sub meta {
    return (
        tickerId             => 'tickerId',
        tickType             => 'tickType',
        basisPoints          => 'double',
        formattedBasisPoints => {},
        totalDividends       => 'double',
        holdDays             => 'int',
        futureExpiry         => {},
        dividendImpact       => 'double',
        dividendsToExpiry    => 'double',
    );
}

1;

