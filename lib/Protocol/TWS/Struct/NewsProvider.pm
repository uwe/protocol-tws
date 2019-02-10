package Protocol::TWS::Struct::NewsProvider;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
        providerCode => {},
        providerName => {},
    );
}

1;
