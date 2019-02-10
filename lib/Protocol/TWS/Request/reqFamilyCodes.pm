package Protocol::TWS::Request::reqFamilyCodes;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 80 }

sub _meta {}

sub _version { undef }

sub _response {
    return (
        familyCodes => 'single',
    );
}

1;
