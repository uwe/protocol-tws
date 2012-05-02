package Protocol::TWS::Struct::OrderComboLeg;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
     price => {type => 'double'},
    );
}


1;
