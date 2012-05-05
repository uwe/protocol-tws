package Protocol::TWS::Request::reqMktDepth;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 10 }

sub _meta {
    return (
        id       => {alias => 'tickerId'},
        contract => 'Contract',
        numRows  => 'int',
    );
}

sub _version { 3 }

sub _serialize {
    my ($self) = @_;

    my $contract = $self->contract;

    my @out = (
        $self->_id,
        $self->_version,
        $self->id,
        $contract->symbol      || '',
        $contract->secType     || '',
        $contract->expiry      || '',
        $contract->strike      || '',
        $contract->right       || '',
        $contract->multiplier  || '',
        $contract->exchange    || '',
        $contract->currency    || '',
        $contract->localSymbol || '',
        $self->numRows         || '',
    );

    return @out;
}


1;

