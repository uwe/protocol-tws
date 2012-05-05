package Protocol::TWS::Util::Lines;

use strict;
use warnings;


sub new {
    my ($class, $data, $lines) = @_;

    my $self = bless {
        data  => scalar @$data,
        lines => $lines,
    }, $class;

    $self->check;

    return $self;
}

sub add {
    my ($self, $add) = @_;

    $self->{lines} += $add;

    $self->check;
}

sub check {
    my ($self) = @_;

    my $diff = $self->{lines} - $self->{data};
    die \$diff if $diff > 0;
}

1;

