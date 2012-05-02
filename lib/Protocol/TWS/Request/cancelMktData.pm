package Protocol::TWS::Request::cancelMktData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 2 }

sub _meta {
    return (
        id => 'tickerId',
    );
}

1;

