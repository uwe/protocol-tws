package Protocol::TWS::Request::reqMktData;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 1 }

sub _meta {
    return (
        id              => {alias => 'tickerId'},
        contract        => 'Contract',
        genericTicklist => {},
        snapshot        => 'bool',
        mktDataOptions  => {},
    );
}

sub _response {
    my ($self) = @_;

    return (
        tickEFP               => 'cont',
        tickGeneric           => 'cont',
        tickOptionComputation => 'cont',
        tickPrice             => 'cont',
        tickSize              => 'cont',
        tickString            => 'cont',
        tickSnapshotEnd       => 'end',
    );
}

sub _version { 11 }

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

    if (my $under_comp = $contract->underComp) {
        push @out, (
            1,
            $under_comp->conId || '',
            $under_comp->delta || '',
            $under_comp->price || '',
        );
    } else {
        push @out, 0;
    }

    push @out, (
        $self->genericTicklist || '',
        $self->snapshot        || '',
        $self->mktDataOptions  || '',
    );

    return @out;
}


1;

