package Protocol::TWS::Response::positionMulti;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 71 }

sub _meta {
    return (
        account   => {},
        modelCode => {},
        contract  => 'Contract',
        position  => 'double',
        avgCost   => 'double',
    );
}

sub _lines { 15 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $account = shift @$data;

    my %contract = (
        conId        => shift @$data,
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

    my %data = (
        account   => $account,
        contract  => Protocol::TWS::Struct::Contract->new(%contract),
        position  => shift @$data,
        avgCost   => shift @$data,
        modelCode => shift @$data,
    );

    return $class->new(%data);
}

1;
