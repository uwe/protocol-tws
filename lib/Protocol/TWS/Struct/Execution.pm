package Protocol::TWS::Struct::Execution;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub meta {
    (
     execId      => {},
     time        => {},
     acctNumber  => {},
     exchange    => {},
     side        => {},
     shares      => {type => 'int',    default => 0},
     price       => {type => 'double', default => 0},
     permId      => {type => 'int',    default => 0},
     clientId    => {type => 'long',   default => 0},
     orderId     => {type => 'long',   default => 0},
     liquidation => {type => 'int'},
     cumQty      => {type => 'int',    default => 0},
     avgPrice    => {type => 'double', default => 0},
     orderRef    => {},
    );
}


1;
