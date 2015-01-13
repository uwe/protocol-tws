package Protocol::TWS::Request::reqPositions;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 61 }

sub _meta {}

sub _response {
    return (
        position    => 'cont',
        positionEnd => 'end',
    );
}

1;

