package Protocol::TWS::Request::reqIDs;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 8 }

sub _meta {
    return (
        numIds => 'int',
    );
}

1;

