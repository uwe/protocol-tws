package Protocol::TWS::Response::position;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 61 }

sub _meta {
    return (
        account  => {},
        contract => 'Contract',
        position => 'int',
        avgCost  => 'double',
    );
}

sub _minimum_version { 3 }

sub _lines { 14 }

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
        account  => $account,
        contract => Protocol::TWS::Struct::Contract->new(%contract),
        position => shift @$data,
        avgCost  => shift @$data,
    );

    return $class->new(%data);
}

1;

