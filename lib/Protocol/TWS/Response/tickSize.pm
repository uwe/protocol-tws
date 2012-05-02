package Protocol::TWS::Response::tickSize;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 2 }

sub _meta {
    return (
        id    => 'tickerId',
        field => 'tickType',
        size  => 'int',
    );
}

1;

