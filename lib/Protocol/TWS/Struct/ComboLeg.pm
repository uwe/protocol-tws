package Protocol::TWS::Struct::ComboLeg;

# ABSTRACT: represent combo legs

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
     conId              => {type => 'long', default => 0},
     ratio              => {type => 'long', default => 0},
     action             => {},
     exchange           => {},
     openClose          => {type => 'long', default => 0},
     shortSaleSlot      => {type => 'long', default => 0, enum => [qw/1 2/]},
     designatedLocation => {},
     exemptCode         => {type => 'int',  default => -1},
    );
}

1;

__END__

=pod

=head1 DESCRIPTION

This structure is part of L<Protocol::TWS::Struct::Order>.

=head1 INSTANCE VARIABLES

=head2 conId

=head2 ratio

=head2 action

=head2 exchange

=head2 openClose

=head2 shortSaleSlot

=head2 designatedLocation

=head2 exemptCode

=head1 SEE ALSO

L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/comboleg.htm>

=cut
