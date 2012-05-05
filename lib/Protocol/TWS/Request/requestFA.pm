package Protocol::TWS::Request::requestFA;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 18 }

sub _meta {
    return (
        faDataType => 'long',
    );
}

sub _response {
     return (
          receiveFA => 'single',
     );
}

1;

