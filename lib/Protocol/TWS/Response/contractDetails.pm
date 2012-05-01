package Protocol::TWS::Response::contractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 10 }

sub meta {
    return (
        reqId           => 'int',
        contractDetails => 'ContractDetails',
    );
}

1;

