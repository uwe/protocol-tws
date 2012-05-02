package Protocol::TWS::Request::reqContractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 9 }

sub _meta {
    return (
        reqId    => 'int',
        contract => 'Contract',
    );
}

1;

