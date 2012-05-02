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
            warn "installing $full_name...";
            *$full_name = sub { (shift)->{$name} };
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

    return 1 + scalar keys %meta;
}

sub _minimum_version { 1 }

sub _parse {
    my ($class, $version, @data) = @_;

    ###TODO### check _lines?

    my @meta = $class->_name;

    my %data = ();
    while (@meta) {
        my $name = shift @meta;
        my $meta = shift @meta;

        ###TODO### check data types?

        $data{$name} = shift @data;
    }

    return $class->new(%data);
}


1;

