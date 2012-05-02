package Protocol::TWS::Response::contractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 10 }

sub _meta {
    return (
        reqId           => 'int',
        contractDetails => 'ContractDetails',
    );
}

1;

