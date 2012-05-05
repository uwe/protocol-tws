package Protocol::TWS::Request::reqCurrentTime;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 49 }

sub _meta {
}

sub _response {
    return (
        currentTime => 'single',
    );
}

1;

