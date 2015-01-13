package Protocol::TWS::Request::verifyMessage;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 66 }

sub _meta {
    return (
        apiData => {},
    );
}

sub _response {
    warn 'TODO';
}

1;

