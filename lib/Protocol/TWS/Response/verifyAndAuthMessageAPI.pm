package Protocol::TWS::Response::verifyAndAuthMessageAPI;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 69 }

sub _meta {
    return (
        apiData      => {},
        xyzChallenge => {},
    );
}

1;
