package Protocol::TWS::Response::updateMktDepthL2;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 13 }

sub _meta {
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

