package Protocol::TWS::Request::reqHistoricalData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 20 }

sub _meta {
    return (
        id             => {alias => 'tickerId'},
        contract       => 'Contract',
        endDateTime    => {},
        durationStr    => {},
        barSizeSetting => {},
        whatToShow     => {},
        useRTH         => 'int',
        formatDate     => 'int',
        chartOptions   => {},
    );
}

sub _response {
    return (
        historicalData => 'single', ###TODO###
    );
}

sub _version { 6 }

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
        $contract->includeExpired  || '',
        $self->endDateTime         || '',
        $self->barSizeSetting      || '',
        $self->durationStr         || '',
        $self->useRTH              || '',
        $self->whatToShow          || '',
        $self->formatDate          || '',
        $self->chartOptions        || '',
    );

    if ($contract->secType eq 'BAG') {
        my $combo_legs = $contract->comboLegs || [];
        push @out, scalar @$combo_legs;
        foreach my $leg (@$combo_legs) {
            push @out, (
                $leg->conId    || '',
                $leg->ratio    || '',
                $leg->action   || '',
                $leg->exchange || '',
            );
        }
    }

    return @out;
}


1;

