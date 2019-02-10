package Protocol::TWS::Response::execDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::Contract;
use Protocol::TWS::Struct::Execution;


sub _id { 11 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        contract  => 'Contract',
        execution => 'Execution',
    );
}

sub _minimum_version { 10 }

sub _lines { 28 }

sub _parse {
    my ($class, $version, $data) = @_;

    my %data = (
        id => shift @$data
    );

    my $order_id = shift @$data;

    my %contract = (
        condId       => shift @$data,
        symbol       => shift @$data,
        secType      => shift @$data,
        expiry       => shift @$data,
        strike       => shift @$data,
        right        => shift @$data,
        multiplier   => shift @$data,
        exchange     => shift @$data,
        currency     => shift @$data,
        localSymbol  => shift @$data,
        tradingClass => shift @$data,
    );

    my %execution = (
        orderId      => $order_id,
        execId       => shift @$data,
        time         => shift @$data,
        acctNumber   => shift @$data,
        exchange     => shift @$data,
        side         => shift @$data,
        shares       => shift @$data,
        price        => shift @$data,
        permId       => shift @$data,
        clientId     => shift @$data,
        liquidation  => shift @$data,
        cumQty       => shift @$data,
        avgPrice     => shift @$data,
        orderRef     => shift @$data,
        evRule       => shift @$data,
        evMultiplier => shift @$data,
    );

    $data{contract}  = Protocol::TWS::Struct::Contract->new(%contract);

    $data{execution} = Protocol::TWS::Struct::Execution->new(%execution);

    return $class->new(%data);
}


1;
