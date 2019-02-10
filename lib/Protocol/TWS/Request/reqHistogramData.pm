package Protocol::TWS::Request::reqHistogramData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 88 }

sub _meta {
    return (
        id         => {alias => 'reqId'},
        contract   => 'Contract',
        useRTH     => 'bool',
        timePeriod => 'int',
    );
}

sub _response {
    my ($self) = @_;

    return (
        headTimestamp => 'single',
    );
}

sub _version { undef }

sub _serialize {
    my ($self) = @_;

    my @out = (
        $self->_id,
        $self->id,
        $self->_serialize_contract,
        $self->useRTH     || '',
        $self->timePeriod || '',
    );

    return @out;
}


1;
