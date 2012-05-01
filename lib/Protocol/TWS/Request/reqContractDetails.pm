package Protocol::TWS::Request::reqContractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 9 }

sub meta {
    return (
        reqId    => 'int',
        contract => 'Contract',
    );
}

1;

