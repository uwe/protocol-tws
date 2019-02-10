package Protocol::TWS::Response::newsProviders;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::NewsProvider;
use Protocol::TWS::Util::Lines;


sub _id { 85 }

sub _meta {
    return (
        newsProviders => {type => 'array', subtype => 'NewsProvider'},
    );
}

sub _lines { 0 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my @providers = ();

    my $i     = 0;
    my $count = $version;
    $lines->add(2 * $count);
    foreach (1 .. $count) {
        my %data = (
            providerCode => $data->[$i++],
            providerName => $data->[$i++],
        );
        push @providers, Protocol::TWS::Struct::NewsProvider->new(%data);
    }

    return $class->new(newsProviders => \@providers);
}

1;
