package Protocol::TWS::Request::cancelMktData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 2 }

sub meta {
    return (
        id => 'tickerId',
    );
}

1;

