package Protocol::TWS::Response::execDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 11 }

sub meta {
    return (
        reqId     => 'int',
        contract  => 'Contract',
        execution => 'Execution',
    );
}

1;

