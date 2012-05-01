package Protocol::TWS::Response::managedAccounts;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 15 }

sub meta {
    return (
        accountsList => {},
    );
}

1;

