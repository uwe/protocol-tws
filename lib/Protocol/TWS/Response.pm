package Protocol::TWS::Response;

# ABSTRACT: API responses

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
            *$full_name = sub { $_[0]->{$name} };
        }
    }
}

sub new {
    my ($class, %arg) = @_;

    return bless \%arg, $class;
}


sub _name {
    my ($class) = @_;

    return (split /::/, ref($class) || $class)[-1];
}

sub _lines {
    my ($class) = @_;

    my %meta = $class->_meta;

    return scalar keys %meta;
}

sub _minimum_version { 1 }

sub _parse {
    my ($class, $version, $data, $lines) = @_;

    my @meta = $class->_meta;

    my %data = ();
    while (@meta) {
        my $name = shift @meta;
        my $meta = shift @meta;

        ###TODO### check data types?

        $data{$name} = shift @$data;
    }

    return $class->new(%data);
}

1;

=pod

=head1 SYNOPSIS

  my $request = Protocol::TWS::Request::reqCurrentTime->new;
  $tws->call($request, sub {
      my $response = shift;
      print $response->time;
  });

=head1 DESCRIPTION

Data structures for API responses. See
L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/class_ewrapper_functions.htm>.

=head1 SUBCLASSES

=over

=item L<Protocol::TWS::Response::accountDownloadEnd>

=item L<Protocol::TWS::Response::bondContractDetails>

=item L<Protocol::TWS::Response::commissionReport>

=item L<Protocol::TWS::Response::contractDetails>

=item L<Protocol::TWS::Response::contractDetailsEnd>

=item L<Protocol::TWS::Response::currentTime>

=item L<Protocol::TWS::Response::deltaNeutralValidation>

=item L<Protocol::TWS::Response::error>

=item L<Protocol::TWS::Response::execDetails>

=item L<Protocol::TWS::Response::execDetailsEnd>

=item L<Protocol::TWS::Response::fundamentalData>

=item L<Protocol::TWS::Response::historicalData>

=item L<Protocol::TWS::Response::managedAccounts>

=item L<Protocol::TWS::Response::marketDataType>

=item L<Protocol::TWS::Response::nextValidId>

=item L<Protocol::TWS::Response::openOrder>

=item L<Protocol::TWS::Response::openOrderEnd>

=item L<Protocol::TWS::Response::orderStatus>

=item L<Protocol::TWS::Response::reqalTimeBar>

=item L<Protocol::TWS::Response::receiveFA>

=item L<Protocol::TWS::Response::scannerData>

=item L<Protocol::TWS::Response::scannerParameters>

=item L<Protocol::TWS::Response::tickEFP>

=item L<Protocol::TWS::Response::tickGeneric>

=item L<Protocol::TWS::Response::tickOptionComputation>

=item L<Protocol::TWS::Response::tickPrice>

=item L<Protocol::TWS::Response::tickSize>

=item L<Protocol::TWS::Response::tickSnapshotEnd>

=item L<Protocol::TWS::Response::tickString>

=item L<Protocol::TWS::Response::updateAccountTime>

=item L<Protocol::TWS::Response::updateAccountValue>

=item L<Protocol::TWS::Response::updateMktDepth>

=item L<Protocol::TWS::Response::updateMktDepthL2>

=item L<Protocol::TWS::Response::updateNewsBulletin>

=item L<Protocol::TWS::Response::updatePortfolio>

=back

=cut
