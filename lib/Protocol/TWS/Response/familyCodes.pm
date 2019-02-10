package Protocol::TWS::Response::familyCodes;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::FamilyCode;
use Protocol::TWS::Util::Lines;


sub _id { 77 }

sub _meta {
    return (
        id          => {alias => 'reqId'},
        familyCodes => {type => 'array', subtype => 'FamilyCode'},
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
        $lines->add(2 * $count);

        my $i     = 1;
        my @codes = ();
        foreach (1 .. $count) {
            my %code_data = (
                accountID     => $data->[$i++],
                familyCodeStr => $data->[$i++],
            );

            push @codes, Protocol::TWS::Struct::FamilyCode->new(%code_data);
        }
        $data{familyCodes} = \@codes;
    }

    return $class->new(%data);
}

1;
