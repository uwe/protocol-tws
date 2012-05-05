package Protocol::TWS::Request::reqScannerParameters;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 24 }

sub _meta {}

sub _response {
    return (
        scannerParameters => 'single',
    );
}

1;

