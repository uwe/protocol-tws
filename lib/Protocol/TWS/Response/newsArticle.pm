package Protocol::TWS::Response::newsArticle;

use strict;
use warnings;

use base 'Protocol::TWS::Response';


sub _id { 83 }

sub _meta {
    return (
        id          => {alias => 'reqId'},
        articleType => {},
        articleText => {},
    );
}

1;
