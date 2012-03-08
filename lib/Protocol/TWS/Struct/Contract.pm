package Protocol::TWS::Struct::Contract;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub meta {
    (
     conId            => {type => 'long',   default => 0},
     symbol           => {},
     secType          => {enum => [qw/STK OPT FUT IND FOP CASH BAG/]},
     expiry           => {}, ###TODO### YYYYMM
     strike           => {type => 'double', default => 0},
     right            => {enum => [qw/C CALL P PUT/]},
     multiplier       => {},
     exchange         => {},
     primaryExchange  => {},
     currency         => {},
     localSymbol      => {},
     includeExpired   => {type => 'bool',   default => 0},
     secIdType        => {},
     secId            => {},
     comboLegs        => {type => 'array', subtype => 'TWS::ComboLeg'},
     comboLegsDescrip => {},
     underComp        => {type => 'UnderComp'},
    );
}


1;
