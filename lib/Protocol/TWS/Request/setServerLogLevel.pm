package Protocol::TWS::Request::setServerLogLevel;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 14 }

sub _meta {
    return (
        logLevel => 'int',
    );
}

sub _response {}

1;

