package Protocol::TWS::Response::symbolSamples;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::Contract;
use Protocol::TWS::Struct::ContractDescription;
use Protocol::TWS::Util::Lines;


sub _id { 79 }

sub _meta {
    return (
        id                   => {alias => 'reqId'},
        contractDescriptions => {type => 'array', subtype => 'ContractDescription'},
    );
}

sub _lines { 1 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my %data = (
        id => $version,
    );

    my @contract_descriptions = ();

    my $i     = 0;
    my $count = $data->[$i++];
    foreach (1 .. $count) {
        $lines->add(6);

        my %contract = (
            conId           => $data->[$i++],
            symbol          => $data->[$i++],
            secType         => $data->[$i++],
            primaryExchange => $data->[$i++],
            currency        => $data->[$i++],
        );

        my @sec_types = ();
        if (my $sec_types_count = $data->[$i++]) {
            $lines->add($sec_types_count);
            foreach (1 .. $sec_types_count) {
                push @sec_types, $data->[$i++];
            }
        }

        push @contract_descriptions, Protocol::TWS::Struct::ContractDescription->new(
            contract           => Protocol::TWS::Struct::Contract->new(%contract),
            derivativeSecTypes => \@sec_types,
        );
    }

    $data{contractDescriptions} = \@contract_descriptions;

    return $class->new(%data);
}

1;
