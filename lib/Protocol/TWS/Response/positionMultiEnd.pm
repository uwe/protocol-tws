package Protocol::TWS::Response::positionMultiEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 72 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );

}

1;
