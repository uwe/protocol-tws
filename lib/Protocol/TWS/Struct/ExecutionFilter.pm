package Protocol::TWS::Struct::ExecutionFilter;

# ABSTRACT: represent execution filter

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
     clientId => {type => 'long', default => 0},
     acctCode => {},
     time     => {},
     symbol   => {},
     secType  => {},
     exchange => {},
     side     => {},
    );
}


1;

__END__

=pod

=head1 DESCRIPTION

This structure is part of L<Protocal::TWS::Request::reqExecutions>. It filters
the list of executions.

=head1 INSTANCE VARIABLES

=head2 clientId

Client ID.

=head2 acctCode

Account code (only for FA managed accounts).

=head2 time

Execution has to be after this time (format: "yyyymmdd-hh:mm:ss")

=head2 symbol

Symbol.

=head2 secType

Security Type, e. g. C<STK>, C<OPT>, C<FUT> (see L<Protocol::TWS::Struct::Contract>).

=head2 exchange

Exchange.

=head2 side

Side, e. g. C<BUY>, C<SELL> (see L<Protocol::TWS::Struct::Order>).

=head1 SEE ALSO

L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/executionfilter.htm>

=cut
