package Protocol::TWS::Response::updateNewsBulletin;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub id { 14 }

sub meta {
    return (
        msgId        => 'int',
        msgType      => 'int',
        newsMessage  => {},
        origExchange => {},
    );
}

1;

