package Protocol::TWS::Struct::Contract;

# ABSTRACT: represent (basic) contract data

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
     conId            => {type => 'long',   default => 0},
     symbol           => {},
     secType          => {enum => [qw/STK OPT FUT IND FOP CASH BAG/]},
     expiry           => {}, ###TODO### YYYYMM
     strike           => {type => 'double', default => 0},
     right            => {enum => [qw/C CALL P PUT/]},
     multiplier       => {},
     exchange         => {},
     primaryExchange  => {},
     currency         => {},
     localSymbol      => {},
     includeExpired   => {type => 'bool',   default => 0},
     secIdType        => {},
     secId            => {},
     comboLegs        => {type => 'array', subtype => 'ComboLeg'},
     comboLegsDescrip => {},
     underComp        => {type => 'UnderComp'},
    );
}

1;

__END__

=pod

=head1 DESCRIPTION

This structure represents a contract (e. g. for orders or historical data).

=head1 SEE ALSO

L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/contract.htm>

=cut
