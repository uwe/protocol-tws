package Protocol::TWS::Response::updateAccountValue;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 6 }

sub _meta {
    return (
        key         => {},
        value       => {},
        currency    => {},
        accountName => {},
    );
}

1;

