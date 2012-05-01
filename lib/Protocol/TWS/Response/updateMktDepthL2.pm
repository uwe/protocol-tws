package Protocol::TWS::Response::updateMktDepthL2;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 13 }

sub meta {
    return (
        id          => 'tickerId',
        position    => 'int',
        marketMaker => {},
        operation   => 'int',
        side        => 'int',
        price       => 'double',
        size        => 'int',
    );
}

1;

