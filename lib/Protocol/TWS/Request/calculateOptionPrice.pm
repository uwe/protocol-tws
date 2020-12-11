package Protocol::TWS::Request::calculateOptionPrice;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 55 }

sub _meta {
    return (
        id         => {alias => 'reqId'},
        contract   => 'Contract',
        volatility => 'double',
        underPrice => 'double',
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
        $self->volatility || '',
        $self->underPrice || '',
    );

    return @out;
}


1;
