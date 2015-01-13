package Protocol::TWS::Response::verifyCompleted;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 66 }

sub _meta {
    return (
        isSuccessful => {},
        errorText    => {},
    );
}

1;

