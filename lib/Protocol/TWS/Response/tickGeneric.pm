package Protocol::TWS::Response::tickGeneric;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 45 }

sub meta {
    return (
        tickerId => 'tickerId',
        tickType => 'tickType',
        value    => 'double',
    );
}

1;

