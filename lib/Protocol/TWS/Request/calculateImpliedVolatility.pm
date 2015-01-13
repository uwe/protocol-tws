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

    my $contract = $self->contract;

    my @out = (
        $self->_id,
        $self->_version,
        $self->id,
        $contract->conId           || '',
        $contract->symbol          || '',
        $contract->secType         || '',
        $contract->expiry          || '',
        $contract->strike          || '',
        $contract->right           || '',
        $contract->multiplier      || '',
        $contract->exchange        || '',
        $contract->primaryExchange || '',
        $contract->currency        || '',
        $contract->localSymbol     || '',
        $contract->tradingClass    || '',
        $self->optionPrice         || '',
        $self->underPrice          || '',
    );

    return @out;
}


1;

