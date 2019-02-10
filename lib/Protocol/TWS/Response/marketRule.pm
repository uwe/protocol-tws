package Protocol::TWS::Response::marketRule;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::PriceIncrement;
use Protocol::TWS::Util::Lines;


sub _id { 93 }

sub _meta {
    return (
        id              => {alias => 'marketRuleId'},
        priceIncrements => {type => 'array', subtype => 'PriceIncrement'},
    );
}

sub _lines { 1 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my %data = (
        id => $version,
    );

    my @increments = ();

    my $i     = 0;
    my $count = $data->[$i++];
    $lines->add(2 * $count);
    foreach (1 .. $count) {
        my %increment = (
            lowEdge   => $data->[$i++],
            increment => $data->[$i++],
        );
        push @increments, Protocol::TWS::Struct::PriceIncrement->new(%increment);
    }

    $data{priceIncrements} = \@increments;

    return $class->new(%data);
}

1;
