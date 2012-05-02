package Protocol::TWS::Request::reqMktDepth;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 10 }

sub _meta {
    return (
        id       => 'tickerId',
        contract => 'Contract',
        numRows  => 'int',
    );
}

1;

