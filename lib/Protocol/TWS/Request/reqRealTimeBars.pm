package Protocol::TWS::Request::reqRealTimeBars;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 50 }

sub meta {
    return (
        tickerid   => 'tickerId',
        contract   => 'Contract',
        barSize    => 'int',
        whatToShow => {},
        useRTH     => 'bool',
    );
}

1;

