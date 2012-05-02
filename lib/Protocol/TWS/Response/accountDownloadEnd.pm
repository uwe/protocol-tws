package Protocol::TWS::Response::accountDownloadEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 54 }

sub _meta {
    return (
        accountName => {},
    );
}

1;

