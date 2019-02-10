package Protocol::TWS::Request::reqHistoricalTicks;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 96 }

sub _meta {
    return (
        id            => {alias => 'reqId'},
        contract      => 'Contract',
        startDateTime => {},
        endDateTime   => {},
        numberOfTicks => 'int',
        whatToShow    => {},
        useRth        => 'int',
        ignoreSize    => 'bool',
    );
}

sub _version { undef }

sub _response {
    return (
        historicalTicks       => 'cont',
        historicalTicksBidAsk => 'cont',
        historicalTicksLast   => 'cont',
    );
}

sub _serialize {
    my ($self) = @_;

    my @out = (
        $self->_id,
        $self->id,
        $self->_serialize_contract,
        $self->startDateTime || '',
        $self->endDateTime   || '',
        $self->numberOfTicks || '',
        $self->whatToShow    || '',
        $self->useRTH        || '',
        $self->ignoreSize    || '',
    );

    return @out;
}


1;
