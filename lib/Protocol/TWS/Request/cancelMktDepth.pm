package Protocol::TWS::Request::cancelMktDepth;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 11 }

sub _meta {
    return (
        id => {alias => 'tickerId'},
    );
}

sub _response {}

1;

