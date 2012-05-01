package Protocol::TWS::Request::reqExecutions;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 7 }

sub meta {
    return (
        reqId  => 'int',
        filter => 'ExecutionFilter',
    );
}

1;

