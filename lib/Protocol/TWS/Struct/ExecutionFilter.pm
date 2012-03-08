package Protocol::TWS::Struct::ExecutionFilter;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub meta {
    (
     clientId => {type => 'long', default => 0},
     acctCode => {},
     time     => {},
     symbol   => {},
     secType  => {},
     exchange => {},
     side     => {},
    );
}


1;
