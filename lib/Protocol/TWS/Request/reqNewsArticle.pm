package Protocol::TWS::Request::reqNewsArticle;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 84 }

sub _meta {
    return (
        id           => {alias => 'reqId'},
        providerCode => {},
        articleId    => {},
    );
}

sub _version { undef }

sub _response {
    return (
        newsArticle => 'single',
    );
}

1;
