package Protocol::TWS::Request::cancelOrder;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 4 }

sub meta {
    return (
        id => 'orderId',
    );
}

1;

