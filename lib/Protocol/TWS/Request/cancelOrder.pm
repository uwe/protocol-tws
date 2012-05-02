package Protocol::TWS::Request::cancelOrder;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 4 }

sub _meta {
    return (
        id => 'orderId',
    );
}

1;

