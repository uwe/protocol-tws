package Protocol::TWS::Request::replaceFA;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 19 }

sub meta {
    return (
        faDataType => 'long',
        XML        => {},
    );
}

1;

