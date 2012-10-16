package Protocol::TWS::Struct;

# ABSTRACT: common structures

use strict;
use warnings;


sub import {
    my ($class) = @_;
    return if $class eq __PACKAGE__;

    no strict 'refs';

    my %meta = $class->_meta;
    while (my ($name, $meta) = each %meta) {
        $meta = {type => $meta} unless ref $meta;
        my @names = ($name);
        if (my $alias = $meta->{alias}) {
            if (ref $alias) {
                push @names, @$alias;
            } else {
                push @names, $alias;
            }
        }
        foreach my $sub (@names) {
            my $full_name = join('::', $class, $sub);
            next if defined &{$full_name};
            *$full_name = sub {
                if (@_ > 1) {
                    $_[0]->{$name} = $_[1];
                } else {
                    return $_[0]->{$name};
                }
            };
        }
    }
}

sub new {
    my ($class, %arg) = @_;

    return bless \%arg, $class;
}

1;

=pod

=head1 SYNOPSIS

  my $contract = Protocol::TWS::Struct::Contract->new(
      symbol   => 'AAPL',
      secType  => 'STK',
      exchange => 'SMART',
      currency => 'USD',
  );

=head1 DESCRIPTION

Common structures are part of L<requests|Protocol::TWS::Request> and
L<responses|Protocol::TWS::Response>. See
L<SocketClient Propeties|http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/socketclient_properties.htm>.

=head1 SUBCLASSES

=over

=item L<Protocol::TWS::Struct::BarData>

=item L<Protocol::TWS::Struct::ComboLeg>

=item L<Protocol::TWS::Struct::CommissionReport>

=item L<Protocol::TWS::Struct::Contract>

=item L<Protocol::TWS::Struct::ContractDetails>

=item L<Protocol::TWS::Struct::Execution>

=item L<Protocol::TWS::Struct::ExecutionFilter>

=item L<Protocol::TWS::Struct::Order>

=item L<Protocol::TWS::Struct::OrderComboLeg>

=item L<Protocol::TWS::Struct::OrderState>

=item L<Protocol::TWS::Struct::ScanData>

=item L<Protocol::TWS::Struct::ScannerSubscription>

=item L<Protocol::TWS::Struct::UnderComp>

=back

=cut
