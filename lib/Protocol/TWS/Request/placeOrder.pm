package Protocol::TWS::Request::placeOrder;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 3 }

sub _meta {
    return (
        id       => {alias => 'orderId'},
        contract => 'Contract',
        order    => 'Order',
    );
}

sub _version { 38 }

sub _serialize {
    my ($self) = @_;

    my $contract = $self->contract;
    my $order    = $self->order;

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
        $contract->secIdType       || '',
        $contract->secId           || '',
        $order->action             || '',
        $order->totalQuantity      || '',
        $order->orderType          || '',
        $order->lmtPrice           || '',
        $order->auxPrice           || '',
        $order->tif                || '',
        $order->ocaGroup           || '',
        $order->account            || '',
        $order->openClose          || '',
        $order->origin             || '',
        $order->orderRef           || '',
        $order->transmit           || '',
        $order->parentId           || '',
        $order->blockOrder         || '',
        $order->sweepToFill        || '',
        $order->displaySize        || '',
        $order->triggerMethod      || '',
        $order->outsideRth         || '',
        $order->hidden             || '',
    );

    if ($contract->secType eq 'BAG') { 
        my $combo_legs = $contract->comboLegs || [];
        push @out, scalar @$combo_legs;
        foreach my $leg (@$combo_legs) {
            push @out, (
                $leg->conId              || '',
                $leg->ratio              || '',
                $leg->action             || '',
                $leg->exchange           || '',
                $leg->openClose          || '',
                $leg->shortSaleSlot      || '',
                $leg->designatedLocation || '',
            );
        }

        my $order_combo_legs = $order->orderComboLegs || [];
        push @out, scalar @$order_combo_legs;
        foreach my $leg (@$order_combo_legs) {
            push @out, $leg->price || '';
        }

        my $smart_combo_routing_params = $order->smartComboRoutingParams || {};
        push @out, scalar keys %$smart_combo_routing_params;
        while (my ($key, $value) = each %$smart_combo_routing_params) {
            push @out, ($key, $value);
        }
    }

    push @out, (
        '',
        $order->discretionaryAmt              || '',
        $order->goodAfterTime                 || '',
        $order->goodTillDate                  || '',
        $order->faGroup                       || '',
        $order->faMethod                      || '',
        $order->faPercentage                  || '',
        $order->faProfile                     || '',
        $order->shortSaleSlot                 || '',
        $order->designatedLocation            || '',
        $order->exemptCode                    || '',
        $order->ocaType                       || '',
        $order->rule80A                       || '',
        $order->settlingFirm                  || '',
        $order->allOrNone                     || '',
        $order->minQty                        || '',
        $order->percentOffset                 || '',
        $order->eTradeOnly                    || '',
        $order->firmQuoteOnly                 || '',
        $order->nbboPriceCap                  || '',
        $order->auctionStrategy               || '',
        $order->startingPrice                 || '',
        $order->stockRefPrice                 || '',
        $order->delta                         || '',
        $order->stockRangeLower               || '',
        $order->stockRangeUpper               || '',
        $order->overridePercentageConstraints || '',
        $order->volatility                    || '',
        $order->volatilityType                || '',
        $order->deltaNeutralOrderType         || '',
        $order->deltaNeutralAuxPrice          || '',
    );

    if ($order->deltaNeutralOrderType) {
        push @out, (
            $order->deltaNeutralConId           || '',
            $order->deltaNeutralSettlingFirm    || '',
            $order->deltaNeutralClearingAccount || '',
            $order->deltaNeutralClearingIntent  || '',
        );
    }

    push @out, (
        $order->continuousUpdate    || '',
        $order->referencePriceType  || '',
        $order->trailStopPrice      || '',
        $order->trailingPercent     || '',
        $order->scaleInitLevelSize  || '',
        $order->scaleSubsLevelSize  || '',
        $order->scalePriceIncrement || '',
    );

    if ($order->scalePriceIncrement) {
        push @out, (
            $order->scalePriceAdjustValue    || '',
            $order->scalePriceAdjustInterval || '',
            $order->scaleProfitOffset        || '',
            $order->scaleAutoReset           || '',
            $order->scaleInitPosition        || '',
            $order->scaleInitFillQty         || '',
            $order->scaleRandomPercent       || '',
        );
    }

    push @out, $order->hedgeType || '',;

    if ($order->hedgeType) {
        push @out, $order->hedgeParam || '',;
    }

    push @out, (
        $order->optOutSmartRouting || '',
        $order->clearingAccount    || '',
        $order->clearingIntent     || '',
        $order->notHeld            || '',
    );

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

    push @out, $order->algoStrategy || '',;

    if ($order->algoStrategy) {
        my $algo_params = $order->algoParams || {};
        push @out, scalar keys %$algo_params;
        while (my ($key, $value) = each %$algo_params) {
            push @out, ($key, $value);
        }
    }

    push @out, $order->whatIf || '',;

    return @out;
}


1;

