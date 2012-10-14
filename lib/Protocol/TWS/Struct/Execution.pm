package Protocol::TWS::Struct::Execution;

# ABSTRACT: represents an order execution

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
     execId      => {},
     time        => {},
     acctNumber  => {},
     exchange    => {},
     side        => {},
     shares      => {type => 'int',    default => 0},
     price       => {type => 'double', default => 0},
     permId      => {type => 'int',    default => 0},
     clientId    => {type => 'long',   default => 0},
     orderId     => {type => 'long',   default => 0},
     liquidation => {type => 'int'},
     cumQty      => {type => 'int',    default => 0},
     avgPrice    => {type => 'double', default => 0},
     orderRef    => {},
    );
}

1;

__END__

=pod

=head1 DESCRIPTION

This structure is part of L<Protocol::TWS::Response::execDetails>.

=head1 SEE ALSO

L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/execution.htm>

=cut
