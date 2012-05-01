package Protocol::TWS::Response::accountDownloadEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 54 }

sub meta {
    return (
        accountName => {},
    );
}

1;

