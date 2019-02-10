package Protocol::TWS::Struct::PriceIncrement;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
        lowEdge   => 'double',
        increment => 'double',
    );
}

1;
