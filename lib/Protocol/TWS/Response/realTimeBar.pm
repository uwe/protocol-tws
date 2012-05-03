package Protocol::TWS::Response::realTimeBar;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 50 }

sub _meta {
    return (
        id     => {alias => 'reqId'},
        time   => 'long',
        open   => 'double',
        high   => 'double',
        low    => 'double',
        close  => 'double',
        volume => 'long',
        wap    => 'double',
        count  => 'int',
    );
}

1;

