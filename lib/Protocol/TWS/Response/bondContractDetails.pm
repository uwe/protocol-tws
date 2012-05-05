package Protocol::TWS::Response::bondContractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Util::Lines;


sub _id { 18 }

sub _meta {
    return (
        id              => {alias => 'reqId'},
        contractDetails => 'ContractDetails',
    );
}

sub _minimum_version { 6 }

sub _lines { 30 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new(
        data  => $data,
        lines => $class->_lines,
    );

    my %data = (
        id => $data->[0],
    );

    my %contract = (
        symbol   => $data->[1],
        secType  => $data->[2],
        exchange => $data->[14],
        currency => $data->[15],
        conId    => $data->[18],
    );

    my %contract_details = (
        cusip             => $data->[3],
        coupon            => $data->[4],
        maturity          => $data->[5],
        issueDate         => $data->[6],
        ratings           => $data->[7],
        bondType          => $data->[8],
        couponType        => $data->[9],
        convertible       => $data->[10],
        callable          => $data->[11],
        putable           => $data->[12],
        descAppend        => $data->[13],
        marketName        => $data->[16],
        tradingClass      => $data->[17],
        minTick           => $data->[19],
        orderTypes        => $data->[20],
        validExchanges    => $data->[21],
        nextOptionDate    => $data->[22],
        nextOptionType    => $data->[23],
        nextOptionPartial => $data->[24],
        notes             => $data->[25],
        longName          => $data->[26],
        evRule            => $data->[27],
        evMultiplier      => $data->[28],
    );


    my $sec_id_count = $data->[29];
    if ($sec_id_count > 0) {
        $lines->add(2 * $sec_id_count);

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

