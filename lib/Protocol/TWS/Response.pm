package Protocol::TWS::Response;

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
            *$full_name = sub { $_[0]->{$name} };
        }
    }
}

sub new {
    my ($class, %arg) = @_;

    return bless \%arg, $class;
}


sub _lines {
    my ($class) = @_;

    my %meta = $class->_meta;

    return scalar keys %meta;
}

sub _minimum_version { 1 }

sub _parse {
    my ($class, $version, $data) = @_;

    # check lines
    if (@$data < $class->_lines) {
        die \($class->_lines);
    }

    my @meta = $class->_meta;

    my %data = ();
    while (@meta) {
        my $name = shift @meta;
        my $meta = shift @meta;

        ###TODO### check data types?

        $data{$name} = shift @$data;
    }

    return $class->new(%data);
}


1;

