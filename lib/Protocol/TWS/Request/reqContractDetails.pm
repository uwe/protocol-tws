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

sub _version { 7 }

sub _serialize {
    my ($self) = @_;

    my $contract = $self->contract;

    my @out = (
        $self->_id,
        $self->_version,
        $self->id,
        $contract->conId          || '',
        $contract->symbol         || '',
        $contract->secType        || '',
        $contract->expiry         || '',
        $contract->strike         || '',
        $contract->right          || '',
        $contract->multiplier     || '',
        $contract->exchange       || '',
        $contract->currency       || '',
        $contract->localSymbol    || '',
        $contract->tradingClass   || '',
        $contract->includeExpired || '',
        $contract->secIdType      || '',
        $contract->secId          || '',
    );

    return @out;
}


1;

