#!/usr/bin/env perl

use strict;
use warnings;

use Module::Find ();

use lib 'lib';


list_ids('Request');
list_ids('Response');


sub list_ids {
    my ($type) = @_;

    print "$type:\n";

    my $class_prefix = 'Protocol::TWS::' . $type;
    my @classes = Module::Find::useall($class_prefix);
    my %id = ();
    foreach my $class (@classes) {
        $class =~ /${class_prefix}::(.+)/;
        $id{$class->id} = $1;
    }

    foreach my $id (sort { $a <=> $b } keys %id) {
        printf("%2d %s\n", $id, $id{$id});
    }
}

