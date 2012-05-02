package Protocol::TWS::Request::reqMktData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 1 }

sub _meta {
    return (
        id              => 'tickerId',
        contract        => 'Contract',
        genericTicklist => {},
        snapshot        => 'bool',
    );
}

1;

