package Protocol::TWS::Response::openOrder;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Util::Lines;


sub _id { 5 }

sub _meta {
    return (
        id         => {alias => 'orderId'},
        contract   => 'Contract',
        order      => 'Order',
        orderState => 'OrderState',
    );
}

sub _minimum_version { 32 }

sub _lines { 96 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new($data, $class->_lines);

    my $i = 0;
    my %data = (
        id => $data->[$i++],
    );

    my %contract = (
        conId        => $data->[$i++],
        symbol       => $data->[$i++],
        secType      => $data->[$i++],
        expiry       => $data->[$i++],
        strike       => $data->[$i++],
        right        => $data->[$i++],
        multiplier   => $data->[$i++],
        exchange     => $data->[$i++],
        currency     => $data->[$i++],
        localSymbol  => $data->[$i++],
        tradingClass => $data->[$i++],
    );

    my %order = (
        action                => $data->[$i++],
        totalQuantity         => $data->[$i++],
        orderType             => $data->[$i++],
        lmtPrice              => $data->[$i++],
        auxPrice              => $data->[$i++],
        tif                   => $data->[$i++],
        ocaGroup              => $data->[$i++],
        accout                => $data->[$i++],
        openClose             => $data->[$i++],
        origin                => $data->[$i++],
        orderRef              => $data->[$i++],
        clientId              => $data->[$i++],
        permId                => $data->[$i++],
        outsideRth            => $data->[$i++],
        hidden                => $data->[$i++],
        discretionaryAmt      => $data->[$i++],
        goodAfterTime         => $data->[$i++],
        sharesAllocation      => $data->[$i++], # deprecated
        faGroup               => $data->[$i++],
        faMethod              => $data->[$i++],
        faPercentage          => $data->[$i++],
        faProfile             => $data->[$i++],
        goodTillDate          => $data->[$i++],
        rule80A               => $data->[$i++],
        percentOffset         => $data->[$i++],
        settlingFirm          => $data->[$i++],
        shortSaleSlot         => $data->[$i++],
        designatedLocation    => $data->[$i++],
        exemptCode            => $data->[$i++],
        auctionStrategy       => $data->[$i++],
        startingPrice         => $data->[$i++],
        stockRefPrice         => $data->[$i++],
        delta                 => $data->[$i++],
        stockRangeLower       => $data->[$i++],
        stockRangeUpper       => $data->[$i++],
        displaySize           => $data->[$i++],
        blockOrder            => $data->[$i++],
        sweepToFill           => $data->[$i++],
        allOrNone             => $data->[$i++],
        minQty                => $data->[$i++],
        ocaType               => $data->[$i++],
        eTradeOnly            => $data->[$i++],
        firmQuoteOnly         => $data->[$i++],
        nbboPriceCap          => $data->[$i++],
        parentId              => $data->[$i++],
        triggerMethod         => $data->[$i++],
        volatility            => $data->[$i++],
        volatilityType        => $data->[$i++],
        deltaNeutralOrderType => $data->[$i++],
        deltaNeutralAuxPrice  => $data->[$i++],
    );

    # deprecated
    delete $order{sharesAllocation};

    if ($order{deltaNeutralOrderType}) {
        $order{deltaNeutralConId}           = $data->[$i++];
        $order{deltaNeutralSettlingFirm}    = $data->[$i++];
        $order{detlaNeutralClearingAccount} = $data->[$i++];
        $order{deltaNeutralClearingIntent}  = $data->[$i++];
    }
    else {
        $order{deltaNeutralOpenClose}          = $data->[$i++];
        $order{deltaNeutralShortSale}          = $data->[$i++];
        $order{deltaNeutralShortSaleSlot}      = $data->[$i++];
        $order{deltaNeutralDesignatedLocation} = $data->[$i++];
    }

    $order{continuousUpdate}   = $data->[$i++];
    $order{referencePriceType} = $data->[$i++];
    $order{trailStopPrice}     = $data->[$i++];
    $order{trailingPercent}    = $data->[$i++];
    $order{basisPoints}        = $data->[$i++];
    $order{basisPointsType}    = $data->[$i++];

    $contract{comboLegsDescrip} = $data->[$i++];

    if (my $combo_legs_count = $data->[$i++]) {
        $lines->add(8 * $combo_legs_count);

        my @combo_legs = ();
        foreach (1 .. $combo_legs_count) {
            my %combo_leg = (
                conId              => $data->[$i++],
                ratio              => $data->[$i++],
                action             => $data->[$i++],
                exchange           => $data->[$i++],
                openClose          => $data->[$i++],
                shortSaleSlot      => $data->[$i++],
                designatedLocation => $data->[$i++],
                exemptCode         => $data->[$i++],
            );
            my $combo_leg = Protocol::TWS::Struct::ComboLeg->new(%combo_leg);
            push @combo_legs, $combo_leg;
        }
        $contract{comboLegs} = \@combo_legs;
    }

    if (my $order_combo_legs_count = $data->[$i]) {
        $lines->add($order_combo_legs_count);

        my @order_combo_legs = ();
        foreach (1 .. $order_combo_legs_count) {
            my %order_combo_leg = (
                price => $data->[$i++],
            );
            my $order_combo_leg = Protocol::TWS::Struct::OrderComboLeg->new(%order_combo_leg);
            push @order_combo_legs, $order_combo_leg;
        }
        $order{orderComboLegs} = \@order_combo_legs;
    }

    if (my $smart_combo_routing_params_count = $data->[$i++]) {
        $lines->add(2 * $smart_combo_routing_params_count);

        my %smart_combo_routing_params = ();
        foreach (1 .. $smart_combo_routing_params_count) {
            $smart_combo_routing_params{$data->[$i++]} = $data->[$i++];
        }
        $order{smartComboRoutingParams} = \%smart_combo_routing_params;
    }

    $order{scaleInitLevelSize}  = $data->[$i++];
    $order{scaleSubsLevelSize}  = $data->[$i++];
    $order{scalePriceIncrement} = $data->[$i++];

    if ($order{scalePriceIncrement}) {
        $lines->add(7);

        $order{scalePriceAdjustValue}    = $data->[$i++];
        $order{scalePriceAdjustInterval} = $data->[$i++];
        $order{scaleProfitOffset}        = $data->[$i++];
        $order{scaleAutoReset}           = $data->[$i++];
        $order{scaleInitPosition}        = $data->[$i++];
        $order{scaleInitFillQty}         = $data->[$i++];
        $order{scaleRandomPercent}       = $data->[$i++];
    }

    $order{hedgeType} = $data->[$i++];

    if ($order{hedgeType}) {
        $lines->add(1);

        $order{hedgeParam} = $data->[$i++];
    }

    $order{optOutSmartRouting} = $data->[$i++];
    $order{clearingAccount}    = $data->[$i++];
    $order{clearingIntent}     = $data->[$i++];
    $order{notHeld}            = $data->[$i++];

    if ($data->[$i++]) {
        $lines->add(3);

        my %under_comp = (
            conId => $data->[$i++],
            delta => $data->[$i++],
            price => $data->[$i++],
        );
        my $under_comp = Protocol::TWS::Struct::UnderComp->new(%under_comp);
        $contract{underComp} = $under_comp;
    }

    $order{algoStrategy} = $data->[$i++];

    if ($order{algoStrategy}) {
        $lines->add(1);

        if (my $algo_params_count = $data->[$i++]) {
            $lines->add(2 * $algo_params_count);

            my %algo_params = ();
            foreach (1 .. $algo_params_count) {
                $algo_params{$data->[$i++]} = $data->[$i++];
            }
            $order{algoParams} = \%algo_params;
        }
    }

    $order{whatIf} = $data->[$i++];

    my %order_state = (
        status             => $data->[$i++],
        initMargin         => $data->[$i++],
        maintMargin        => $data->[$i++],
        equityWithLoan     => $data->[$i++],
        commission         => $data->[$i++],
        minCommission      => $data->[$i++],
        maxCommission      => $data->[$i++],
        commissionCurrency => $data->[$i++],
        warningText        => $data->[$i++],
    );

    $data{contract}    = Protocol::TWS::Struct::Contract->new(%contract);
    $data{order}       = Protocol::TWS::Struct::Order->new(%order);
    $data{order_state} = Protocol::TWS::Struct::OrderState->new(%order_state);

    return $class->new(%data);
}


1;

