package Protocol::TWS::Request::exerciseOptions;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 21 }

sub _meta {
    return (
        id               => {alias => 'tickerId'},
        contract         => 'Contract',
        exerciseAction   => 'int',
        exerciseQuantity => 'int',
        account          => {},
        override         => 'int',
    );
}

sub _response {
    warn 'TODO';
}

sub _serialize {
    my ($self) = @_;

    my $contract = $self->contract;

    my @out = (
        $self->_id,
        $self->_version,
        $self->id,
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
        $self->exerciseAction      || '',
        $self->exerciseQuantity    || '',
        $self->account             || '',
        $self->override            || '',
    );

    return @out;
}

1;

