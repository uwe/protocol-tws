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
        $self->volatility          || '',
        $self->underPrice          || '',
    ); 
    
    return @out;
}   


1;

