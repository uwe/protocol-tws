package Protocol::TWS::Response;

use strict;
use warnings;


sub lines {
    # version
    return 1 + scalar (shift)->meta;
}

# minimum version
sub min_version { 1 }

1;

