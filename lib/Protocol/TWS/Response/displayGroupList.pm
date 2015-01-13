package Protocol::TWS::Response::displayGroupList;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 67 }

sub _meta {
    return (
        id     => {alias => 'reqId'},
        groups => {},
    );
}

1;

