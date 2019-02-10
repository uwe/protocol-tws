package Protocol::TWS::Response::tickNews;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 84 }

sub _meta {
    return (
        id           => {alias => 'tickerId'},
        timeStamp    => {},
        providerCode => {},
        articleId    => {},
        headline     => {},
        extraData    => {},
    );
}

1;
