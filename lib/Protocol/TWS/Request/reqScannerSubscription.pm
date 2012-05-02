package Protocol::TWS::Request::reqScannerSubscription;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 22 }

sub _meta {
    return (
        tickerId     => 'int',
        subscription => 'ScannerSubscription',
    );
}

1;

