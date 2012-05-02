package Protocol::TWS::Response::execDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 11 }

sub _meta {
    return (
        reqId     => 'int',
        contract  => 'Contract',
        execution => 'Execution',
    );
}

1;

