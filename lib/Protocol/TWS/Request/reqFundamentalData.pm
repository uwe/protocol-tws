package Protocol::TWS::Request::reqFundamentalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 52 }

sub meta {
    return (
        reqId      => 'tickerId',
        contract   => 'Contract',
        reportType => {},
    );
}

1;

