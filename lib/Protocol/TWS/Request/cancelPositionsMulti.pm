package Protocol::TWS::Request::cancelPositionsMulti;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 75 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

sub _response {}

1;
