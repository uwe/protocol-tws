package Protocol::TWS::Response::tickGeneric;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 45 }

sub _meta {
    return (
        tickerId => {alias => 'tickerId'},
        tickType => 'tickType',
        value    => 'double',
    );
}

1;

