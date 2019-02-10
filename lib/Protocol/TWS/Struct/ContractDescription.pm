package Protocol::TWS::Struct::ContractDescription;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
        contract           => 'Contract',
        derivativeSecTypes => 'array',
    );
}

1;
