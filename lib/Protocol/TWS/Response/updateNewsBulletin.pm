package Protocol::TWS::Response::updateNewsBulletin;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 14 }

sub _meta {
    return (
        msgId        => 'int',
        msgType      => 'int',
        newsMessage  => {},
        origExchange => {},
    );
}

1;

