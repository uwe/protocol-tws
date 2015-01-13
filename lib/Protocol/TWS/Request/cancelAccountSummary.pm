package Protocol::TWS::Request::cancelAccountSummary;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 63 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

sub _response {}

1;

