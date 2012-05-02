package Protocol::TWS::Response::updateAccountTime;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 8 }

sub _meta {
    return (
        timeStamp => {},
    );
}

1;

