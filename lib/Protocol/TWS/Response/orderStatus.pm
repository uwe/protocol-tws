package Protocol::TWS::Response::orderStatus;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 3 }

sub meta {
    return (
        id            => 'orderId',
        status        => {},
        filled        => 'int',
        remaining     => 'int',
        avgFillPrice  => 'double',
        permId        => 'int',
        parentId      => 'int',
        lastFillPrice => 'double',
        clientId      => 'int',
        whyHeld       => {},
    );
}

1;
