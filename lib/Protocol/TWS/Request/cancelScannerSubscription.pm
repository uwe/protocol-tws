package Protocol::TWS::Request::cancelScannerSubscription;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 23 }

sub _meta {
    return (
        tickerId => 'int',
    );
}

1;

