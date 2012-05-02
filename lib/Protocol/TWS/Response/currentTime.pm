package Protocol::TWS::Response::currentTime;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 49 }

sub _meta {
    return (
        time => 'long',
    );
}

1;

