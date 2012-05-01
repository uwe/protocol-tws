package Protocol::TWS::Response::receiveFA;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 16 }

sub meta {
    return (
        faDataType => 'long',
        XML        => {},
    );
}

1;

