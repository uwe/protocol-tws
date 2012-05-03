package Protocol::TWS::Response::tickEFP;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 47 }

sub _meta {
    return (
        tickerId             => {alias => 'tickerId'},
        tickType             => 'tickType',
        basisPoints          => 'double',
        formattedBasisPoints => {},
        impliedFuture        => 'double',
        holdDays             => 'int',
        futureExpiry         => {},
        dividendImpact       => 'double',
        dividendsToExpiry    => 'double',
    );
}

1;

