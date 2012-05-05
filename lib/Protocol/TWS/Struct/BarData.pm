package Protocol::TWS::Struct::BarData;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    return (
        date     => {},
        open     => 'double',
        high     => 'double',
        low      => 'double',
        close    => 'double',
        volume   => 'int',
        average  => 'double',
        hasGaps  => {},
        barCount => 'int',
    );
}


1;
