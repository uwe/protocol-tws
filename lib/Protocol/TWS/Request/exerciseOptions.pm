package Protocol::TWS::Request::exerciseOptions;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 21 }

sub _meta {
    return (
        id               => 'long',
        contract         => 'Contract',
        exerciseAction   => 'int',
        exerciseQuantity => 'int',
        account          => {},
        override         => 'int',
    );
}

1;

