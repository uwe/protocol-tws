package Protocol::TWS::Response::accountSummaryEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 64 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

1;

