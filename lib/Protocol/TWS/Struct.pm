package Protocol::TWS::Base;

use strict;
use warnings;


sub new {
    my ($class, %arg) = @_;

    my $self = bless {}, $class;

    my %schema = $self->schema;
    foreach my $key (keys %schema) {
        ###TODO### validate
        $self->{$key} = delete $arg{$key} || $schema{$key}{default};
    }

    return $self;
}

sub schema {
    my ($self) = @_;

    ###TODO### cache?

    my @meta = $self->meta;
    for (my $i = 1; $i < @meta; $i+=2) {
        my $item = $meta[$i];
        $item->{type} ||= 'string';
        ###TODO### set default values
    }

    return @meta;
}

sub validate {
    my ($self) = @_;

    ###TODO###
}


1;
