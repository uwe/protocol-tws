package Protocol::TWS::Struct::ScannerSubscription;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub meta {
    (
     numberOfRows             => {type => 'int',    default => -1},
     instrument               => {},
     locationCode             => {},
     scanCode                 => {},
     abovePrice               => {type => 'double'},
     belowPrice               => {type => 'double'},
     aboveVolume              => {type => 'int'},
     marketCapAbove           => {type => 'double'},
     marketCapBelow           => {type => 'double'},
     moodyRatingAbove         => {},
     moodyRatingBelow         => {},
     spRatingAbove            => {},
     spRatingBelow            => {},
     maturityDateAbove        => {},
     maturityDateBelow        => {},
     couponRateAbove          => {type => 'double'},
     couponRateBelow          => {type => 'double'},
     excludeConvertible       => {type => 'int',    default => 0},
	 averageOptionVolumeAbove => {type => 'int',    default => 0},
	 scannerSettingPairs      => {},
	 stockTypeFilter          => {},
    );
}


1;
