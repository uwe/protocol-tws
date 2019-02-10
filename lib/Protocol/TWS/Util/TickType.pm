package Protocol::TWS::Util::TickType;

use strict;
use warnings;


my $TICK_TYPE = {
    0 => 'bidSize',
    1 => 'bidPrice',
    2 => 'askPrice',
    3 => 'askSize',
    4 => 'lastPrice',
    5 => 'lastSize',
    6 => 'high',
    7 => 'low',
    8 => 'volume',
    9 => 'close',
    10 => 'bidOptComp',
    11 => 'askOptComp',
    12 => 'lastOptComp',
    13 => 'modelOptComp',
    14 => 'open',
    15 => '13WeekLow',
    16 => '13WeekHigh',
    17 => '26WeekLow',
    18 => '26WeekHigh',
    19 => '52WeekLow',
    20 => '52WeekHigh',
    21 => 'AvgVolume',
    22 => 'OpenInterest',
    23 => 'OptionHistoricalVolatility',
    24 => 'OptionImpliedVolatility',
    25 => 'OptionBidExchStr',
    26 => 'OptionAskExchStr',
    27 => 'OptionCallOpenInterest',
    28 => 'OptionPutOpenInterest',
    29 => 'OptionCallVolume',
    30 => 'OptionPutVolume',
    31 => 'IndexFuturePremium',
    32 => 'bidExch',
    33 => 'askExch',
    34 => 'auctionVolume',
    35 => 'auctionPrice',
    36 => 'auctionImbalance',
    37 => 'markPrice',
    38 => 'bidEFP',
    39 => 'askEFP',
    40 => 'lastEFP',
    41 => 'openEFP',
    42 => 'highEFP',
    43 => 'lowEFP',
    44 => 'closeEFP',
    45 => 'lastTimestamp',
    46 => 'shortable',
    47 => 'fundamentals',
    48 => 'RTVolume',
    49 => 'halted',
    50 => 'bidYield',
    51 => 'askYield',
    52 => 'lastYield',
    53 => 'custOptComp',
    54 => 'trades',
    55 => 'trades/min',
    56 => 'volume/min',
    57 => 'lastRTHTrade',
    58 => 'RTHistoricalVol',

    61 => 'regulatoryImbalance',
};


sub get_field {
    my ($class, $tick_type) = @_;

    return $TICK_TYPE->{$tick_type};
}

1;
