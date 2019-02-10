package Protocol::TWS::Response::historicalNews;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 86 }

sub _meta {
    return (
        id           => {alias => 'reqId'},
        time         => {},
        providerCode => {},
        articleId    => {},
        headline     => {},
    );
}

1;
