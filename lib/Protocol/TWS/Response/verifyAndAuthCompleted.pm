package Protocol::TWS::Response::verifyAndAuthCompleted;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 70 }

sub _meta {
    return (
        isSuccessful => 'bool',
        errorText    => {},
    );
}

1;
