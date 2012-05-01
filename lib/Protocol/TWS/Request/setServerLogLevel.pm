package Protocol::TWS::Request::setServerLogLevel;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 14 }

sub meta {
    return (
        logLevel => 'int',
    );
}

1;

