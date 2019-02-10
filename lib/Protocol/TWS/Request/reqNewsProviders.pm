package Protocol::TWS::Request::reqNewsProviders;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 85 }

sub _meta {}

sub _version { undef }

sub _response {
    return (
        newsProviders => 'single',
    );
}

1;
