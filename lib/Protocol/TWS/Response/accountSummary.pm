package Protocol::TWS::Response::accountSummary;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 63 }

sub _meta {
    return (
        id       => {alias => 'reqId'},
        account  => {},
        tag      => {},
        value    => {},
        currency => {},
    );
}

1;

