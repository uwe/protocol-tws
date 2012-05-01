package Protocol::TWS::Request::reqMktDataType;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 59 }

sub meta {
    return (
        marketDataType => 'int',
    );
}

1;

