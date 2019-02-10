package Protocol::TWS::Struct::DepthMktDataDescription;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
        exchange        => {},
        secType         => {},
        listingExch     => {},
        serviceDataType => {},
        aggGroup        => 'int',
    );
}

1;
