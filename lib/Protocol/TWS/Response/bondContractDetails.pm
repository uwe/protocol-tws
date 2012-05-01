package Protocol::TWS::Response::bondContractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 18 }

sub meta {
    return (
        reqId           => 'int',
        contractDetails => 'ContractDetails',
    );
}

1;

