package Protocol::TWS::Response::error;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 4 }

sub meta {
    return (
        id          => 'int',
        errorCode   => 'int',
        errorString => {},
    );
}

1;

