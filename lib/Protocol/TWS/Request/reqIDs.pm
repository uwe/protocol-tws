package Protocol::TWS::Request::reqIDs;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 8 }

sub meta {
    return (
        numIds => 'int',
    );
}

1;

