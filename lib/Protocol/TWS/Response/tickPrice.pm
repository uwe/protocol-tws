package Protocol::TWS::Response::tickPrice;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 1 }

sub _meta {
    return (
        id             => {alias => 'tickerId'},
        field          => 'tickType',
        price          => 'double',
        size           => 'int',
        canAutoExecute => 'int',
    );
}

1;

