package Protocol::TWS::Request::reqAccountUpdatesMulti;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 76 }

sub _meta {
    return (
        id           => {alias => 'reqId'},
        account      => {},
        modelCode    => {},
        ledgerAndNLV => 'bool',
    );
}

sub _response {
    return (
        accountUpdateMulti    => 'cont',
        accountUpdateMultiEnd => 'end',
    );
}

1;
