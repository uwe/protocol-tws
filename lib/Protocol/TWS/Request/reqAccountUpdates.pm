package Protocol::TWS::Request::reqAccountUpdates;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 6 }

sub meta {
    return (
        subscribe => 'bool',
        acctCode  => {},
    );
}

1;

