package Protocol::TWS::Request::reqRealTimeBars;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 50 }

sub _meta {
    return (
        tickerid   => 'tickerId',
        contract   => 'Contract',
        barSize    => 'int',
        whatToShow => {},
        useRTH     => 'bool',
    );
}

1;

