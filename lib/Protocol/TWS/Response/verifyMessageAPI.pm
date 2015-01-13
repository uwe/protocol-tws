package Protocol::TWS::Response::verifyMessageAPI;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 65 }

sub _meta {
    return (
        apiData => {},
    );
}

1;

