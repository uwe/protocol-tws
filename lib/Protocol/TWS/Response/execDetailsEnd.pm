package Protocol::TWS::Response::execDetailsEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 55 }

sub _meta {
    return (
        reqId => 'int',
    );
}

1;

