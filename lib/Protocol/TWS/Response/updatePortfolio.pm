package Protocol::TWS::Response::updatePortfolio;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 7 }

sub _meta {
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

