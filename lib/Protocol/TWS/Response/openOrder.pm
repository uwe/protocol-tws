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

sub _minimum_version { 30 }

sub _lines { 90 }

sub _parse {
    my ($class, $version, $data) = @_;

    my $lines = Protocol::TWS::Util::Lines->new(
        data  => $data,
        lines => $class->_lines,
    );

    my %data = (
        id => $data->[0],
    );

    my %contract = (
        conId       => $data->[1],
        symbol      => $data->[2],
        secType     => $data->[3],
        expiry      => $data->[4],
        strike      => $data->[5],
        right       => $data->[6],
        exchange    => $data->[7],
        currency    => $data->[8],
        localSymbol => $data->[9],
    );

    my %order = (
        action                => $data->[10],
        totalQuantity         => $data->[11],
        orderType             => $data->[12],
        lmtPrice              => $data->[13],
        auxPrice              => $data->[14],
        tif                   => $data->[15],
        ocaGroup              => $data->[16],
        accout                => $data->[17],
        openClose             => $data->[18],
        origin                => $data->[19],
        orderRef              => $data->[20],
        clientId              => $data->[21],
        permId                => $data->[22],
        outsideRth            => $data->[23],
        hidden                => $data->[24],
        discretionaryAmt      => $data->[25],
        goodAfterTime         => $data->[26],
        faGroup               => $data->[28],
        faMethod              => $data->[29],
        faPercentage          => $data->[30],
        faProfile             => $data->[31],
        goodTillDate          => $data->[32],
        rule80A               => $data->[33],
        percentOffset         => $data->[34],
        settlingFirm          => $data->[35],
        shortSaleSlot         => $data->[36],
        designatedLocation    => $data->[37],
        exemptCode            => $data->[38],
        auctionStrategy       => $data->[39],
        startingPrice         => $data->[40],
        stockRefPrice         => $data->[41],
        delta                 => $data->[42],
        stockRangeLower       => $data->[43],
        stockRangeUpper       => $data->[44],
        displaySize           => $data->[45],
        blockOrder            => $data->[46],
        sweepToFill           => $data->[47],
        allOrNone             => $data->[48],
        minQty                => $data->[49],
        ocaType               => $data->[50],
        eTradeOnly            => $data->[51],
        firmQuoteOnly         => $data->[52],
        nbboPriceCap          => $data->[53],
        parentId              => $data->[54],
        triggerMethod         => $data->[55],
        volatility            => $data->[56],
        volatilityType        => $data->[57],
        deltaNeutralOrderType => $data->[58],
        deltaNeutralAuxPrice  => $data->[59],
    );

    my $i = 60;
    if ($order{deltaNeutralOrderType}) {
        $lines->add(4);

        $order{deltaNeutralConId}           = $data->[$i++];
        $order{deltaNeutralSettlingFirm}    = $data->[$i++];
        $order{detlaNeutralClearingAccount} = $data->[$i++];
        $order{deltaNeutralClearingIntent}  = $data->[$i++];
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

