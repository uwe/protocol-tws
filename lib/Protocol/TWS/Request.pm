package Protocol::TWS::Request;

use strict;
use warnings;


sub import {
    my ($class) = @_;
    return if $class eq __PACKAGE__;

    no strict 'refs';

    my %meta = $class->_meta;
    while (my ($name, $meta) = each %meta) {
        $meta = {type => $meta} unless ref $meta;
        my @names = ($name);
        if (my $alias = $meta->{alias}) {
            if (ref $alias) {
                push @names, @$alias;
            } else {
                push @names, $alias;
            }
        }
        foreach my $sub (@names) {
            my $full_name = join('::', $class, $sub);
            *$full_name = sub {
                if (@_ > 1) {
                    $_[0]->{$name} = $_[1];
                } else {
                    return $_[0]->{$name};
                }
            };
        }
    }
}

sub new {
    my ($class, %arg) = @_;

    return bless \%arg, $class;
}


sub _version { 1 }

sub _serialize {
    my ($self) = @_;

    my @meta = $self->_meta;

    my @out = (
        $self->_id,
        $self->_version,
    );
    while (@meta) {
        my $name = shift @meta;
        my $meta = shift @meta;

        ###TODO### check data types?
        
        push @out, $self->$name;
    }

    return @out;
}


1;

