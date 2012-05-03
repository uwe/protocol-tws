package Protocol::TWS::Response::fundamentalData;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 51 }

sub _meta {
    return (
        id   => {alias => 'reqId'},
        data => {},
    );
}

1;

