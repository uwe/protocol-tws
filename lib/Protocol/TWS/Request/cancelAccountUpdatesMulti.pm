package Protocol::TWS::Request::cancelAccountUpdatesMulti;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 77 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

sub _response {}

1;
