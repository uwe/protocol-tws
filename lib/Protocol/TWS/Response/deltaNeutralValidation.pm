package Protocol::TWS::Response::deltaNeutralValidation;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 56 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        underComp => 'UnderComp',
    );
}

sub _lines { 4 }

sub _parse {
    my ($class, $version, $data) = @_;

    my %data = (
        id => $data->[0],
    );

    my %under_comp = (
        conId => $data->[1],
        delta => $data->[2],
        price => $data->[3],
    );

    $data{underComp} = Protocol::TWS::Struct::UnderComp->new(%under_comp);

    return $class->new(%data);
}


1;

