package Protocol::TWS::Request::exerciseOptions;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 21 }

sub meta {
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

