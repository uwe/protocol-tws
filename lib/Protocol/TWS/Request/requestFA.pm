package Protocol::TWS::Request::requestFA;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 18 }

sub meta {
    return (
        faDataType => 'long',
    );
}

1;

