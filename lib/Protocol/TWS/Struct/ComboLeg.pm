package Protocol::TWS::Struct::ComboLeg;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub meta {
    (
     conId              => {type => 'long', default => 0},
     ratio              => {type => 'long', default => 0},
     action             => {},
     exchange           => {},
     openClose          => {type => 'long', default => 0},
     shortSaleSlot      => {type => 'long', default => 0, enum => [qw/1 2/]},
     designatedLocation => {},
     exemptCode         => {type => 'int',  default => -1},
    );
}


1;
