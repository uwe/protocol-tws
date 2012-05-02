package Protocol::TWS::Response::tickSnapshotEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 57 }

sub _meta {
    return (
        reqId => 'int',
    );
}

1;

