package Protocol::TWS::Request::reqHeadTimestamp;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 87 }

sub _meta {
    return (
        id         => {alias => 'tickerId'},
        contract   => 'Contract',
        whatToShow => {},
        useRTH     => 'int',
        formatDate => 'int',
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

    my $contract = $self->contract;

    my @out = (
        $self->_id,
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
        $contract->includeExpired  || '',

        $self->useRTH     || '',
        $self->whatToShow || '',
        $self->formatDate || '',
    );

    return @out;
}


1;
