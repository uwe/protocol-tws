package Protocol::TWS::Response::scannerParameters;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 19 }

sub _meta {
    return (
        xml => {},
    );
}

1;

