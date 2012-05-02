package Protocol::TWS::Request::reqHistoricalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 20 }

sub _meta {
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

