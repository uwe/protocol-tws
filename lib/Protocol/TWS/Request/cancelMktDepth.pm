package Protocol::TWS::Request::cancelMktDepth;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 11 }

sub meta {
    return (
        id => 'tickerId',
    );
}

1;

