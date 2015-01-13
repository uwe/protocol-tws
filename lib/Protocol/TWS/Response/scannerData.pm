package Protocol::TWS::Response::scannerData;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Util::Lines;


sub _id { 20 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        scan_data => {type => 'array', subtype => 'ScanData'},
    );
}

sub _lines { 2 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my %data = (
        id => $data->[0],
    );

    if (my $scan_data_count = $data->[1]) {
        $lines->add(16 * $scan_data_count);

        my $i         = 2;
        my @scan_data = ();
        foreach (1 .. $scan_data_count) {
            my %scan_data = (
                rank => $data->[$i++],
            );

            my %contract = (
                conId        => $data->[$i++],
                symbol       => $data->[$i++],
                secType      => $data->[$i++],
                expiry       => $data->[$i++],
                strike       => $data->[$i++],
                right        => $data->[$i++],
                exchange     => $data->[$i++],
                currency     => $data->[$i++],
                localSymbol  => $data->[$i++],
                marketName   => $data->[$i++], # belongs to contract_details
                tradingClass => $data->[$i++],
            );

            my %contract_details = (
                marketName => delete $contract{marketName},
            );

            $contract_details{summary} = Protocol::TWS::Struct::Contract->new(%contract);

            $scan_data{distance}   = $data->[$i++];
            $scan_data{benchmark}  = $data->[$i++];
            $scan_data{projection} = $data->[$i++];
            $scan_data{legsStr}    = $data->[$i++];

            $scan_data{contract} = Protocol::TWS::Struct::ContractDetails->new(%contract_details);

            push @scan_data, Protocol::TWS::Struct::ScanData->new(%scan_data);
        }
        $data{scan_data} = \@scan_data;
    }

    return $class->new(%data);
}


1;

