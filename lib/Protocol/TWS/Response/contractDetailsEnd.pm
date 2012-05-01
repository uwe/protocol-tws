package Protocol::TWS::Response::contractDetailsEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 52 }

sub meta {
    return (
        reqId => 'int',
    );
}

1;

