package Protocol::TWS::Response::historicalNewsEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 87 }

sub _meta {
    return (
        id      => {alias => 'reqId'},
        hasMore => 'bool',
    );
}

1;
