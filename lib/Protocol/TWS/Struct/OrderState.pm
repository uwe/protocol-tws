package Protocol::TWS::Struct::OrderState;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub meta {
    (
     status             => {},
     initMargin         => {},
     maintMargin        => {},
     equityWithLoan     => {},
     commission         => {type => 'double'},
     minCommission      => {type => 'double'},
     maxCommission      => {type => 'double'},
     commissionCurrency => {},
     warningText        => {},
    );
}


1;
