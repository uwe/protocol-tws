package Protocol::TWS::Response::execDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 11 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        contract  => 'Contract',
        execution => 'Execution',
    );
}

sub _minimum_version { 9 }

sub _lines { 27 }

sub _parse {
    my ($class, $version, $data) = @_;

    my %data = (
        id => $data->[0],
    );

    my %contract = (
        condId      => $data->[2],
        symbol      => $data->[3],
        secType     => $data->[4],
        expiry      => $data->[5],
        strike      => $data->[6],
        right       => $data->[7],
        multiplier  => $data->[8],
        exchange    => $data->[9],
        currency    => $data->[10],
        localSymbol => $data->[11],
    );

    my %execution = (
        orderId      => $data->[1],
        execId       => $data->[12],
        time         => $data->[13],
        acctNumber   => $data->[14],
        exchange     => $data->[15],
        side         => $data->[16],
        shares       => $data->[17],
        price        => $data->[18],
        permId       => $data->[19],
        clientId     => $data->[20],
        liquidation  => $data->[21],
        cumQty       => $data->[22],
        avgPrice     => $data->[23],
        orderRef     => $data->[24],
        evRule       => $data->[25],
        evMultiplier => $data->[26],
    );

    $data{contract}  = Protocol::TWS::Struct::Contract->new(%contract);

    $data{execution} = Protocol::TWS::Struct::Execution->new(%execution);

    return $class->new(%data);
}


1;

