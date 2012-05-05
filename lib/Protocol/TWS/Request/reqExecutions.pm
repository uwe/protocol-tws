package Protocol::TWS::Request::reqExecutions;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 7 }

sub _meta {
    return (
        id     => {alias => 'reqId'},
        filter => 'ExecutionFilter',
    );
}

sub _version { 3 }

sub _serialize {
    my ($self) = @_;

    my $filter = $self->filter;

    my @out = (
        $self->_id,
        $self->_version,
        $self->id,
        $filter->clientId || '',
        $filter->acctCode || '',
        $filter->time     || '',
        $filter->symbol   || '',
        $filter->secType  || '',
        $filter->exchange || '',
        $filter->side     || '',
    );

    return @out;
}


1;

