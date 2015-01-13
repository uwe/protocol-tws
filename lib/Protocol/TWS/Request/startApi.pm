package Protocol::TWS::Request::startApi;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 71 }

sub _meta {
    return (
        clientId => 'int',
    );
}

sub _response {}

1;

