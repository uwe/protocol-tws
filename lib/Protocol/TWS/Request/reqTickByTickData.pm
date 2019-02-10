package Protocol::TWS::Request::reqTickByTickData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 97 }

sub _meta {
    return (
        id            => {alias => 'reqId'},
        contract      => 'Contract',
        tickType      => {},
        numberOfTicks => 'int',
        ignoreSize    => 'bool',
    );
}

sub _version { undef }

sub _response {
    return (
        tickByTickAllLast  => 'cont',
        tickByTickBidAsk   => 'cont',
        tickByTickMidPoint => 'cont',
    );
}

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

        $self->tickType      || '',
        $self->numberOfTicks || '',
        $self->ignoreSize    || '',
    );

    return @out;
}


1;
