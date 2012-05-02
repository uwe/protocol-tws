package Protocol::TWS::Request::reqFundamentalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 52 }

sub _meta {
    return (
        reqId      => 'tickerId',
        contract   => 'Contract',
        reportType => {},
    );
}

1;

