package Protocol::TWS::Response::updatePortfolio;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::Contract;


sub _id { 7 }

sub _meta {
    return (
        contract      => 'Contract',
        position      => 'int',
        marketPrice   => 'double',
        marketValue   => 'double',
        averageCost   => 'double',
        unrealizedPNL => 'double',
        realizedPNL   => 'double',
        accountName   => {},
    );
}

sub _minimum_version { 8 }

sub _lines { 17 }

sub _parse {
    my ($class, $version, $data) = @_;

    my %contract = (
        conId           => shift @$data,
        symbol          => shift @$data,
        secType         => shift @$data,
        expiry          => shift @$data,
        strike          => shift @$data,
        right           => shift @$data,
        multiplier      => shift @$data,
        primaryExchange => shift @$data,
        currency        => shift @$data,
        localSymbol     => shift @$data,
        tradingClass    => shift @$data,
    );

    my %data = (
        contract      => Protocol::TWS::Struct::Contract->new(%contract),
        position      => shift @$data,
        marketPrice   => shift @$data,
        marketValue   => shift @$data,
        averageCost   => shift @$data,
        unrealizedPNL => shift @$data,
        realizedPNL   => shift @$data,
        accountName   => shift @$data,
    );

    return $class->new(%data);
}


1;
