package Protocol::TWS::Struct::CommissionReport;

# ABSTRACT: represent a commission report

use strict;
use warnings;

use base 'Protocol::TWS::Struct';


sub _meta {
    (
     execId              => {},
     commission          => {type => 'double', default => 0},
     currency            => {},
     realizedPNL         => {type => 'double', default => 0},
     yield               => {type => 'double', default => 0},
     yieldRedemptionDate => {type => 'int',    default => 0},
    );
}

1;

__END__

=pod

=head1 DESCRIPTION

This structure is part of L<Protocol::TWS::Response::commissionReport>.

=cut
