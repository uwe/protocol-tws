package Protocol::TWS::Request::reqAccountUpdates;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 6 }

sub _meta {
    return (
        subscribe => 'bool',
        acctCode  => {},
    );
}

sub _version { 2 }

sub _response {
    return (
        updateAccountValue => 'cont',
        updatePortfolio    => 'cont',
        updateAccountTime  => 'cont',
        accountDownloadEnd => 'end', ###TODO### cont
    );
}

1;

