package Protocol::TWS::Request::reqAutoOpenOrders;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 15 }

sub _meta {
    return (
        bAutoBind => {type => 'bool', default => 0},
    );
}

sub _response {
    warn 'TODO';
}

1;

