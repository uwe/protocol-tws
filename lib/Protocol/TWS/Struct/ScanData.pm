package Protocol::TWS::Struct::ScanData;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    return (
        contract   => 'ContractDetails',
        rank       => 'int',
        distance   => {},
        benchmark  => {},
        projection => {},
        legsStr    => {},
    );
}


1;
