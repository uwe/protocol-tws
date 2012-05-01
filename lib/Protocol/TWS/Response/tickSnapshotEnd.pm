package Protocol::TWS::Response::tickSnapshotEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 57 }

sub meta {
    return (
        reqId => 'int',
    );
}

1;

