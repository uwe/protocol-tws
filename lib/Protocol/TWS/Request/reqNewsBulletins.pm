package Protocol::TWS::Request::reqNewsBulletins;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 12 }

sub _meta {
    return (
        allMsgs => 'bool',
    );
}

1;

