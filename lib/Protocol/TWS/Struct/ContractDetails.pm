package Protocol::TWS::Struct::ContractDetails;

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
     summary           => {type => 'Contract'},
     marketName        => {},
     tradingClass      => {},
     minTick           => {type => 'double', default => 0},
     orderTypes        => {},
     validExchanges    => {},
     priceMagnifier    => {type => 'long',   default => 0},
     underConId        => {type => 'int',    default => 0},
     longName          => {},
     contractMonth     => {},
     industry          => {},
     category          => {},
     subcategory       => {},
     timeZoneId        => {},
     tradingHours      => {},
     liquidHours       => {},
     evRule            => {},
     evMultiplier      => 'double',
     secIdList         => {type => 'hash'},
     cusip             => {},
     ratings           => {},
     descAppend        => {},
     bondType          => {},
     couponType        => {},
     callable          => {type => 'bool',   default => 0},
     putable           => {type => 'bool',   default => 0},
     coupon            => {type => 'double', default => 0},
     convertible       => {type => 'bool',   default => 0},
     maturity          => {},
     issueDate         => {},
     nextOptionDate    => {},
     nextOptionType    => {},
     nextOptionPartial => {type => 'bool',   default => 0},
     notes             => {},
    );
}


1;
