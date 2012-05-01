package Protocol::TWS::Response::currentTime;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 49 }

sub meta {
    return (
        time => 'long',
    );
}

1;

