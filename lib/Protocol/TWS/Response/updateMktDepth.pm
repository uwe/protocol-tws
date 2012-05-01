package Protocol::TWS::Response::updateMktDepth;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 12 }

sub meta {
    return (
        id        => 'tickerId',
        position  => 'int',
        operation => 'int',
        side      => 'int',
        price     => 'double',
        size      => 'int',
    );
}

1;

