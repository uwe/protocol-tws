package Protocol::TWS::Response::bondContractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 18 }

sub _meta {
    return (
        reqId           => 'int',
        contractDetails => 'ContractDetails',
    );
}

1;

