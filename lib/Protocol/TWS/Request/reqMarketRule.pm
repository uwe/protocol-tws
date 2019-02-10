package Protocol::TWS::Request::reqMarketRule;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 91 }

sub _meta {
    return (
        id => {alias => 'marketRuleId'},
    );
}

sub _version { undef }

sub _response {
    return (
        marketRule => 'single',
    );
}

1;
