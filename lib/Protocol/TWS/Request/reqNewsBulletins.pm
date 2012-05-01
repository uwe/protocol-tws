package Protocol::TWS::Request::reqNewsBulletins;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub id { 12 }

sub meta {
    return (
        allMsgs => 'bool',
    );
}

1;

