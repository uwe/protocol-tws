package Protocol::TWS::Request::reqHistoricalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 20 }

sub meta {
    return (
        id             => 'tickerId',
        contract       => 'Contract',
        endDateTime    => {},
        durationStr    => {},
        barSizeSetting => {},
        whatToShow     => {},
        useRTH         => 'int',
        formatDate     => 'int',
    );
}

1;

