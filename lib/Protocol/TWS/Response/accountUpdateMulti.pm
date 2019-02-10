package Protocol::TWS::Response::accountUpdateMulti;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 73 }

sub _meta {
    return (
        id        => {alias => 'reqId'},
        account   => {},
        modelCode => {},
        key       => {},
        value     => {},
        currency  => {},
    );
}

1;
