package Protocol::TWS::Request::reqScannerSubscription;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 22 }

sub meta {
    return (
        tickerId     => 'int',
        subscription => 'ScannerSubscription',
    );
}

1;

