package Protocol::TWS::Response::securityDefinitionOptionParameterEnd;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 76 }

sub _meta {
    return (
        id => {alias => 'reqId'},
    );

}

1;
