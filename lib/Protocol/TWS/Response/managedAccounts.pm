package Protocol::TWS::Response::managedAccounts;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 15 }

sub _meta {
    return (
        accountsList => {},
    );
}

1;

