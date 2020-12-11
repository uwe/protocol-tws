package Protocol::TWS::Request::reqContractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 9 }

sub _meta {
    return (
        id       => {alias => 'reqId'},
        contract => 'Contract',
    );
}

sub _response {
    return (
        contractDetails    => 'cont',
        contractDetailsEnd => 'end',
    );
}

sub _version { 8 }

sub _serialize {
    my ($self) = @_;

    my @out = (
        $self->_id,
        $self->_version,
        $self->id,
        $self->_serialize_contract,
    );

    return @out;
}


1;
