package Protocol::TWS::Struct::CommissionReport;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub meta {
    (
     execId              => {},
     commission          => {type => 'double', default => 0},
     currency            => {},
     realizedPNL         => {type => 'double', default => 0},
     yield               => {type => 'double', default => 0},
     yieldRedemptionDate => {type => 'int',    default => 0},
    );
}


1;
