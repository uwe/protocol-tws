package Protocol::TWS::Request::reqAutoOpenOrders;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 15 }

sub meta {
    return (
        bAutoBind => {type => 'bool', default => 0},
    );
}

1;

