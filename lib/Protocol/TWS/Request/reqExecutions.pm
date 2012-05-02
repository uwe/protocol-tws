package Protocol::TWS::Request::reqExecutions;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 7 }

sub _meta {
    return (
        reqId  => 'int',
        filter => 'ExecutionFilter',
    );
}

1;

