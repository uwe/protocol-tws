package Protocol::TWS::Request::placeOrder;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 3 }

sub _meta {
    return (
        id       => 'orderId',
        contract => 'Contract',
        order    => 'Order',
    );
}

1;

