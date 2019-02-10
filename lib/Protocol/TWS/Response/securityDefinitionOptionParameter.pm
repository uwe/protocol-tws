package Protocol::TWS::Response::securityDefinitionOptionParameter;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Util::Lines;


sub _id { 75 }

sub _meta {
    return (
        id              => {alias => 'reqId'},
        exchange        => {},
        underlyingConId => 'int',
        tradingClass    => {},
        multiplier      => {},
        expirations     => 'array',
        strikes         => 'array',
    );
}

sub _lines { 5 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my %data = (
        id              => $version,
        exchange        => $data->[0],
        underlyingConId => $data->[1],
        tradingClass    => $data->[2],
        multiplier      => $data->[3],
    );

    my $i = 4;
    my $expirations_size = $data->[$i++];
    if ($expirations_size > 0) {
        $lines->add($expirations_size + 1);

        my @expirations = @$data[$i .. $i + $expirations_size];
        $i += $expirations_size;

        $data{expirations} = \@expirations;
    }

    my $strikes_size = $data->[$i++];
    if ($strikes_size > 0) {
        $lines->add($strikes_size);

        my @strikes = @$data[$i .. $i + $strikes_size];
        $i += $strikes_size;

        $data{strikes} = \@strikes;
    }

    return $class->new(%data);
}


1;
