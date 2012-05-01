package Protocol::TWS::Request::reqMktDepth;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 10 }

sub meta {
    return (
        id       => 'tickerId',
        contract => 'Contract',
        numRows  => 'int',
    );
}

1;

