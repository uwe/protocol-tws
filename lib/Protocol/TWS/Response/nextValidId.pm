package Protocol::TWS::Response::nextValidId;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 9 }

sub meta {
    return (
        orderId => 'orderId',
    );
}

1;

