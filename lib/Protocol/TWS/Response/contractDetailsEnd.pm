package Protocol::TWS::Response::contractDetailsEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 52 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

1;

