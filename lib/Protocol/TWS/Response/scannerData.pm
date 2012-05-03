package Protocol::TWS::Response::scannerData;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 20 }

sub _meta {
    return (
        id              => {alias => 'reqId'},
        rank            => 'int',
        contractDetails => 'ContractDetails',
        distance        => {},
        benchmark       => {},
        projection      => {},
        legsStr         => {},
    );
}

sub _lines { die }

sub _parse {
    die
}

1;

