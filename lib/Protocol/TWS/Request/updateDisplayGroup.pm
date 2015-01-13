package Protocol::TWS::Request::updateDisplayGroup;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 69 }

sub _meta {
    return (
        id           => {alias => 'reqId'},
        contractInfo => {},
    );
}

sub _response {
    warn 'TODO';
}

1;


