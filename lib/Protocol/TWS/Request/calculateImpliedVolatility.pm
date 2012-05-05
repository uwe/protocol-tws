package Protocol::TWS::Request::calculateImpliedVolatility;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 54 }

sub _meta {
    return (
        id          => {alias => 'reqid'},
        contract    => 'Contract',
        optionPrice => 'double',
        underPrice  => 'double',
    );
}

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
        $self->optionPrice         || '',
        $self->underPrice          || '',
    );

    return @out;
}


1;

