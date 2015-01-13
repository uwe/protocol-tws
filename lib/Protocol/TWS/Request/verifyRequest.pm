package Protocol::TWS::Request::verifyRequest;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 65 }

sub _meta {
    return (
        apiName    => {},
        apiVersion => {},
    );
}

sub _response {
    warn 'TODO';
}

1;

