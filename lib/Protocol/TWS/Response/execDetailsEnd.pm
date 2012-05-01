package Protocol::TWS::Response::execDetailsEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 55 }

sub meta {
    return (
        reqId => 'int',
    );
}

1;

