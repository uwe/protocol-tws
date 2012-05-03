package Protocol::TWS::Response::contractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 10 }

sub _meta {
    return (
        id              => {alias => 'reqId'},
        contractDetails => 'ContractDetails',
    );
}

sub _minimum_version { 8 }

sub _lines { 30 }

sub _parse {
    my ($class, $version, $data) = @_;

    my %data = (
        id => $data->[0],
    );

    my %contract = (
        symbol          => $data->[1],
        secType         => $data->[2],
        expiry          => $data->[3],
        strike          => $data->[4],
        right           => $data->[5],
        exchange        => $data->[6],
        currency        => $data->[7],
        localSymbol     => $data->[8],
        conId           => $data->[11],
        multiplier      => $data->[13],
        primaryExchange => $data->[19],
    );

    my %contract_details = (
        marketName      => $data->[9],
        tradingClass    => $data->[10],
        minTick         => $data->[12],
        orderTypes      => $data->[14],
        validExchanges  => $data->[15],
        priceMagnifier  => $data->[16],
        underConId      => $data->[17],
        longName        => $data->[18],
        contractMonth   => $data->[20],
        industry        => $data->[21],
        category        => $data->[22],
        subcategory     => $data->[23],
        timeZoneId      => $data->[24],
        tradingHours    => $data->[25],
        liquidHours     => $data->[26],
        evRule          => $data->[27],
        evMultiplier    => $data->[28],
    );

    my $sec_id_count = $data->[29];
    if ($sec_id_count > 0) {
        if (@$data < 30 + 2 * $sec_id_count) {
            die \(2 * $sec_id_count);
        }

        my %sec_id = ();
        my $i = 30;
        foreach (1 .. $sec_id_count) {
            $sec_id{$data->[$i++]} = $data->{$i++};
        }

        $contract_details{secIdList} = \%sec_id;
    }

    $contract_details{summary} = Protocol::TWS::Struct::Contract->new(%contract);

    $data{contractDetails} = Protocol::TWS::Struct::ContractDetails->new(%contract_details);

    return $class->new(%data);
}


1;

