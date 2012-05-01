package Protocol::TWS::Response::updateAccountValue;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 6 }

sub meta {
    return (
        key         => {},
        value       => {},
        currency    => {},
        accountName => {},
    );
}

1;

