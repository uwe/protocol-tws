#!/usr/bin/env perl

use strict;
use warnings;

use Module::Find;

use lib 'lib';

foreach my $class (findallmod 'Protocol::TWS') {
    eval "use $class";
    die $@ if $@;
}

