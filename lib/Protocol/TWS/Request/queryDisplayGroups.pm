package Protocol::TWS::Request::queryDisplayGroups;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 67 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );
}

sub _response {
    return (
        displayGroupList => 'single',
    );
}

1;

