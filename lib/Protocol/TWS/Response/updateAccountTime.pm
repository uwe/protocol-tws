package Protocol::TWS::Response::updateAccountTime;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 8 }

sub meta {
    return (
        timeStamp => {},
    );
}

1;

