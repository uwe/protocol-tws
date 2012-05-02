package Protocol::TWS::Request::reqAccountUpdates;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 6 }

sub _meta {
    return (
        subscribe => 'bool',
        acctCode  => {},
    );
}

1;

