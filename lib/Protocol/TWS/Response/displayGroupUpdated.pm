package Protocol::TWS::Response::displayGroupUpdated;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 68 }

sub _meta {
    return (
        id           => {alias => 'reqId'},
        contractInfo => {},
    );
}

1;

