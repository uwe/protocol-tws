package Protocol::TWS::Response::historicalData;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 17 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        startDate => {},
        endDate   => {},
        bars      => {type => 'array', subtype => 'BarData'},
    );
}

sub _lines { 4 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my %data = (
        id        => $data->[0],
        startDate => $data->[1],
        endDate   => $data->[2],
    );

    if (my $bar_count = $data->[3]) {
        $lines->add(9 * $bar_count);

        my $i = 4;
        my @bars = ();
        foreach (1 .. $bar_count) {
            my %bar_data = (
                date     => $data->[$i++],
                open     => $data->[$i++],
                high     => $data->[$i++],
                low      => $data->[$i++],
                close    => $data->[$i++],
                volume   => $data->[$i++],
                average  => $data->[$i++],
                hasGaps  => $data->[$i++],
                barCount => $data->[$i++],
            );
            push @bars, Protocol::TWS::Struct::BarData->new(%bar_data);
        }
        $data{bars} = \@bars;
    }

    return $class->new(%data);
}


1;

