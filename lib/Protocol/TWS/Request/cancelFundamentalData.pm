package Protocol::TWS::Request::cancelFundamentalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 53 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

1;

