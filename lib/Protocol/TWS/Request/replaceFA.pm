package Protocol::TWS::Request::replaceFA;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 19 }

sub _meta {
    return (
        faDataType => 'long',
        XML        => {},
    );
}

sub _response {
    warn 'TODO';
}

1;

