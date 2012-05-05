package Protocol::TWS::Request::cancelRealTimeBars;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 51 }

sub _meta {
    return (
        id => {alias => 'tickerId'},
    );
}

sub _response {}

1;

