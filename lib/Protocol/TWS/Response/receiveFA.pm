package Protocol::TWS::Response::receiveFA;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 16 }

sub _meta {
    return (
        faDataType => 'long',
        XML        => {},
    );
}

1;

