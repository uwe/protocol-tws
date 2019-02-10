package Protocol::TWS::Request::reqHistoricalNews;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 86 }

sub _meta {
    return (
        id            => {alias => 'reqId'},
        conId         => 'int',
        providerCode  => {},
        startDateTime => {},
        endDateTime   => {},
        totalResults  => 'int',
    );
}

sub _version { undef }

sub _response {
    return (
        historicalNews    => 'cont',
        historicalNewsEnd => 'end',
    );
}

1;
