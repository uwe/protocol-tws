package Protocol::TWS::Struct::FamilyCode;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
        accountID     => {},
        familyCodeStr => {},
    );
}

1;
