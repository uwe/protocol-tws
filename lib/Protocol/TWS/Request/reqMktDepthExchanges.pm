package Protocol::TWS::Request::reqMktDepthExchanges;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 82 }

sub _meta {}

sub _version { undef }

sub _response {
    return (
        mktDepthExchanges => 'single',
    );
}

1;
