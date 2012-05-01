package Protocol::TWS::Response::tickString;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 46 }

sub meta {
    return (
        tickerId => 'tickerId',
        tickType => 'tickType',
        value    => {},
    );
}

1;

