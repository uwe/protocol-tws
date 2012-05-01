package Protocol::TWS::Response::tickSize;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 2 }

sub meta {
    return (
        id    => 'tickerId',
        field => 'tickType',
        size  => 'int',
    );
}

1;

