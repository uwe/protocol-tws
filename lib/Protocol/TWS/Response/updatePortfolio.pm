package Protocol::TWS::Response::updatePortfolio;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 7 }

sub meta {
    return (
        contract      => 'Contract',
        position      => 'int',
        marketPrice   => 'double',
        marketValue   => 'double',
        averageCost   => 'double',
        unrealizedPNL => 'double',
        realizedPNL   => 'double',
        accountName   => {},
    );
}

1;

