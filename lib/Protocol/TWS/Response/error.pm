package Protocol::TWS::Response::error;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 4 }

sub _meta {
    return (
        id          => 'int',
        errorCode   => 'int',
        errorString => {},
    );
}

1;

