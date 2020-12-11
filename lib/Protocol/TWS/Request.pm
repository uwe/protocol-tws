package Protocol::TWS::Request;

# ABSTRACT: API requests

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


sub _version { 1 }

sub _serialize {
    my ($self) = @_;

    my @meta = $self->_meta;

    my @out = ($self->_id);
    push @out, $self->_version if $self->_version;
    while (@meta) {
        my $name = shift @meta;
        my $meta = shift @meta;

        ###TODO### check data types?

        push @out, $self->$name;
    }

    return @out;
}

sub _serialize_contract {
    my ($self) = @_;

    my $contract = $self->contract;

    return (
        $contract->conId           || '',
        $contract->symbol          || '',
        $contract->secType         || '',
        $contract->expiry          || '',
        $contract->strike          || '',
        $contract->right           || '',
        $contract->multiplier      || '',
        $contract->exchange        || '',
        $contract->primaryExchange || '',
        $contract->currency        || '',
        $contract->localSymbol     || '',
        $contract->tradingClass    || '',
        $contract->includeExpired  || '',
        $contract->secIdType       || '',
        $contract->secId           || '',
    );
}

1;

=pod

=head1 SYNOPSIS

  my $request = Protocol::TWS::Request::reqCurrentTime->new;
  $tws->call($request, sub { print (shift)->time });

=head1 DESCRIPTION

Data structures for API requests. See
L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/class_eclientsocket_functions.htm>.

=head1 SUBCLASSES

=over

=item L<Protocol::TWS::Request::calculateImpliedVolatility>

=item L<Protocol::TWS::Request::calculateOptionPrice>

=item L<Protocol::TWS::Request::cancelAccountSummary>

=item L<Protocol::TWS::Request::cancelCalculateImpliedVolatility>

=item L<Protocol::TWS::Request::cancelCalculateOptionPrice>

=item L<Protocol::TWS::Request::cancelFundamentalData>

=item L<Protocol::TWS::Request::cancelHistoricalData>

=item L<Protocol::TWS::Request::cancelMktData>

=item L<Protocol::TWS::Request::cancelMktDepth>

=item L<Protocol::TWS::Request::cancelNewsBulletins>

=item L<Protocol::TWS::Request::cancelOrder>

=item L<Protocol::TWS::Request::cancelPositions>

=item L<Protocol::TWS::Request::cancelRealTimeBars>

=item L<Protocol::TWS::Request::cancelScannerSubscription>

=item L<Protocol::TWS::Request::exerciseOptions>

=item L<Protocol::TWS::Request::placeOrder>

=item L<Protocol::TWS::Request::queryDisplayGroups>

=item L<Protocol::TWS::Request::replaceFA>

=item L<Protocol::TWS::Request::reqAccountSummary>

=item L<Protocol::TWS::Request::reqAccountUpdates>

=item L<Protocol::TWS::Request::reqAllOpenOrders>

=item L<Protocol::TWS::Request::reqAutoOpenOrders>

=item L<Protocol::TWS::Request::reqContractDetails>

=item L<Protocol::TWS::Request::reqCurrentTime>

=item L<Protocol::TWS::Request::reqExecutions>

=item L<Protocol::TWS::Request::reqFundamentalData>

=item L<Protocol::TWS::Request::reqGlobalCancel>

=item L<Protocol::TWS::Request::reqHistoricalData>

=item L<Protocol::TWS::Request::reqIds>

=item L<Protocol::TWS::Request::reqManagedAccts>

=item L<Protocol::TWS::Request::reqMarketDataType>

=item L<Protocol::TWS::Request::reqMktData>

=item L<Protocol::TWS::Request::reqMktDepth>

=item L<Protocol::TWS::Request::reqNewsBulletins>

=item L<Protocol::TWS::Request::reqOpenOrders>

=item L<Protocol::TWS::Request::reqPositions>

=item L<Protocol::TWS::Request::reqRealTimeBars>

=item L<Protocol::TWS::Request::reqScannerParameters>

=item L<Protocol::TWS::Request::reqScannerSubscription>

=item L<Protocol::TWS::Request::requestFA>

=item L<Protocol::TWS::Request::setServerLogLevel>

=item L<Protocol::TWS::Request::startApi>

=item L<Protocol::TWS::Request::subscribeToGroupEvents>

=item L<Protocol::TWS::Request::unsubscribeFromGroupEvents>

=item L<Protocol::TWS::Request::updateDisplayGroup>

=item L<Protocol::TWS::Request::verifyMessage>

=item L<Protocol::TWS::Request::verifyRequest>

=back

=cut
