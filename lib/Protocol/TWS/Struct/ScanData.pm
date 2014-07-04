package Protocol::TWS::Struct::ScanData;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
        contract   => 'ContractDetails',
        rank       => 'int',
        distance   => {},
        benchmark  => {},
        projection => {},
        legsStr    => {},
    );
}


1;
