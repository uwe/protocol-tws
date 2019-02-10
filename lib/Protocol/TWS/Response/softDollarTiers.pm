package Protocol::TWS::Response::softDollarTiers;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::SoftDollarTier;
use Protocol::TWS::Util::Lines;


sub _id { 77 }

sub _meta {
    return (
        id              => {alias => 'reqId'},
        softDollarTiers => {type => 'array', subtype => 'SoftDollarTier'},
    );
}

sub _lines { 1 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my %data = (
        id => $version,
    );

    if (my $count = $data->[0]) {
        $lines->add(3 * $count);

        my $i     = 1;
        my @tiers = ();
        foreach (1 .. $count) {
            my %tier_data = (
                name         => $data->[$i++],
                value        => $data->[$i++],
                display_name => $data->[$i++],
            );

            push @tiers, Protocol::TWS::Struct::SoftDollarTier->new(%tier_data);
        }
        $data{softDollarTiers} = \@tiers;
    }

    return $class->new(%data);
}


1;
