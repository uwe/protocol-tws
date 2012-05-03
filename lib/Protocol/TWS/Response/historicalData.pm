package Protocol::TWS::Response::historicalData;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 17 }

sub _meta {
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

sub _lines { 4 }

sub _parse {
    die
}


1;

