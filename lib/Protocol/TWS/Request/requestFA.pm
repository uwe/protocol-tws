package Protocol::TWS::Request::requestFA;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 18 }

sub _meta {
    return (
        faDataType => 'long',
    );
}

1;

