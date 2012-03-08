package Protocol::TWS::Struct::OrderComboLeg;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub meta {
    (
     price => {type => 'double'},
    );
}


1;
