package Protocol::TWS::Response::accountUpdateMultiEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 74 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );

}

1;
