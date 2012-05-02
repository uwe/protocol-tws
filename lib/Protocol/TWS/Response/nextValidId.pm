package Protocol::TWS::Response::nextValidId;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 9 }

sub _meta {
    return (
        id => {alias => 'orderId'},
    );
}

1;

