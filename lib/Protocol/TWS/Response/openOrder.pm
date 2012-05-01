package Protocol::TWS::Response::openOrder;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 5 }

sub meta {
    return (
        orderId    => 'orderId',
        contract   => 'Contract',
        order      => 'Order',
        orderState => 'OrderState',
    );
}

1;

