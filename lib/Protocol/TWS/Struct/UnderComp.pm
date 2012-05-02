package Protocol::TWS::Struct::UnderComp;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
     conId => {type => 'long',   default => 0},
     delta => {type => 'double', default => 0},
     price => {type => 'double', default => 0},
    );
}


1;
