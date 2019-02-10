package Protocol::TWS::Request::cancelHeadTimestamp;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 90 }

sub _meta {
    return (
        id => {alias => 'tickerId'},
    );
}

sub _version { undef }

sub _response {}

1;
