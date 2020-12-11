package Protocol::TWS::Request::calculateImpliedVolatility;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 54 }

sub _meta {
    return (
        id          => {alias => 'reqId'},
        contract    => 'Contract',
        optionPrice => 'double',
        underPrice  => 'double',
    );
}

sub _response {
    return (
        tickOptionComputation => 'single',
    );
}

sub _version { 2 }

sub _serialize {
    my ($self) = @_;

    my @out = (
        $self->_id,
        $self->_version,
        $self->id,
        $self->_serialize_contract,
        $self->optionPrice || '',
        $self->underPrice  || '',
    );

    return @out;
}


1;
