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
     tradingClass     => {},
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

=head1 INSTANCE VARIABLES

=head2 conId

Contract ID. Used in many requests and responses.

=head2 symbol

Symbol.

=head2 secType

Security Type: C<STK>, C<OPT>, C<FUT>, C<IND>, C<FOP>, C<CASH>, C<BAG>.

=head2 expiry

Expiration date (format: "yyyymm" and "yyyymmdd").

=head2 strike

Strike price.

=head2 right

Option right: C<P>, C<C>, C<PUT>, C<CALL>.

=head2 multiplier

Multiplier (only neccessary when ambiguous).

=head2 exchange

Order destination, e. g. C<SMART>.

=head2 primaryExchange

Primary exchange (to avoid ambiguity).

=head2 currency

Currency (also to avoid ambiguity), e. g. C<USD>.

=head2 localSymbol

Local symbol.

=head2 tradingClass

Trading class name.

=head2 includeExpired

If true, search also expired contracts (e. g. options).

=head2 secIdType

Security identifier type: C<ISIN>, C<CUSIP>, C<SEDOL>, C<RIC>.

=head2 secId

Security identifier.

=head2 comboLegs

Stores legs for combos (see L<Protocol::TWS::Struct::ComboLeg>).

=head2 comboLegsDescrip

Description for combo legs.

=head2 underComp

??? (see L<Protocol::TWS::Struct::UnderComp>).

=head1 SEE ALSO

L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/contract.htm>

=cut
