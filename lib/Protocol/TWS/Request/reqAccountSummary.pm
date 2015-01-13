package Protocol::TWS::Request::reqAccountSummary;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 62 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        groupName => {},
        tags      => {},
    );
}

sub _response {
    return (
        accountSummary    => 'cont',
        accountSummaryEnd => 'end',
    );
}

1;

