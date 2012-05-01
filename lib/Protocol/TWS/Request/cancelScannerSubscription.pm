package Protocol::TWS::Request::cancelScannerSubscription;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 23 }

sub meta {
    return (
        tickerId => 'int',
    );
}

1;

