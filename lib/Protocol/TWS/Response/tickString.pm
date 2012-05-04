package Protocol::TWS::Response::tickString;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 46 }

sub _meta {
    return (
        id       => {alias => 'tickerId'},
        tickType => 'tickType',
        value    => {},
    );
}

1;

