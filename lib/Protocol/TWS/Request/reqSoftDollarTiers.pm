package Protocol::TWS::Request::reqSoftDollarTiers;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 79 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

sub _version { undef }

sub _response {
    return (
        softDollarTiers => 'single',
    );
}

1;
