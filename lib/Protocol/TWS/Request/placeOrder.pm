package Protocol::TWS::Request::placeOrder;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 3 }

sub meta {
    return (
        id       => 'orderId',
        contract => 'Contract',
        order    => 'Order',
    );
}

1;

