package Protocol::TWS::Request::reqFundamentalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 52 }

sub _meta {
    return (
        id         => {alias => 'reqId'},
        contract   => 'Contract',
        reportType => {},
    );
}

sub _response {
    return (
        fundamentalData => 'single', ###TODO### cont ?
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
        $contract->exchange        || '',
        $contract->primaryExchange || '',
        $contract->currency        || '',
        $contract->localSymbol     || '',
        $contract->tradingClass    || '',
        $self->reportType          || '',
    );

    return @out;
}


1;

