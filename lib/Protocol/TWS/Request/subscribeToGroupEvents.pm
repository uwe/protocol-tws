package Protocol::TWS::Request::subscribeToGroupEvents;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 68 }

sub _meta {
    return (
        id      => {alias => 'reqId'},
        groupId => 'int',
    );
}

sub _response {
    return (
        displayGroupUpdated => 'single',
    );
}

1;

