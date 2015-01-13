package Protocol::TWS::Request::unsubscribeFromGroupEvents;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 68 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

sub _response {
    warn 'TODO';
}

1;

