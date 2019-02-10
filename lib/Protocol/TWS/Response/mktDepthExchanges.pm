package Protocol::TWS::Response::mktDepthExchanges;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::DepthMktDataDescription;
use Protocol::TWS::Util::Lines;


sub _id { 80 }

sub _meta {
    return (
        depthMktDataDescriptions => {type => 'array', subtype => 'DepthMktDataDescription'},
    );
}

sub _lines { 0 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my @descriptions = ();

    my $i     = 0;
    my $count = $version;
    $lines->add(5 * $count);
    foreach (1 .. $count) {
        my %data = (
            exchange        => $data->[$i++],
            secType         => $data->[$i++],
            listingExch     => $data->[$i++],
            serviceDataType => $data->[$i++],
            aggGroup        => $data->[$i++],
        );
        push @descriptions, Protocol::TWS::Struct::DepthMktDataDescription->new(%data);
    }

    return $class->new(depthMktDataDescriptions => \@descriptions);
}

1;
