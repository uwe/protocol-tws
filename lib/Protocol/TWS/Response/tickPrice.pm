package Protocol::TWS::Response::tickPrice;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 1 }

sub meta {
    return (
        id             => 'tickerId',
        field          => 'tickType',
        price          => 'double',
        size           => 'int',
        canAutoExecute => 'int',
    );
}

1;

