package Protocol::TWS::Request::reqMktData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 1 }

sub meta {
    return (
        id              => 'tickerId',
        contract        => 'Contract',
        genericTicklist => {},
        snapshot        => 'bool',
    );
}

1;

