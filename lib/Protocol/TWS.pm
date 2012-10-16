package Protocol::TWS;

# ABSTRACT: protocol support for InteractiveBrokers Trader Workstation (TWS) API

use strict;
use warnings;

use Module::Find ();

my @STRUCTS   = Module::Find::useall('Protocol::TWS::Struct');
my @REQUESTS  = Module::Find::useall('Protocol::TWS::Request');
my @RESPONSES = Module::Find::useall('Protocol::TWS::Response');

my %REQUEST_ID  = map { $_->_id => $_ } @REQUESTS;
my %RESPONSE_ID = map { $_->_id => $_ } @RESPONSES;


sub response_by_id {
    my ($class, $id) = @_;
    return $RESPONSE_ID{$id};
}

1;

=pod

=head1 DESCRIPTION

The InteractiveBrokers API consists of common structures (L<Protocol::TWS::Struct>),
requests (L<Protocol::TWS::Request>) and responses (L<Protocol::TWS::Response>).
It is a line based socket protocol. This distribution is part of an inofficial
Perl port of the C++ API (L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/c.htm>).

Have a look at the examples directory in this distribution.

=head1 COMMON STRUCTURES

See L<SocketClient Propeties|http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/socketclient_properties.htm>.

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

=head1 REQUESTS

See L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/class_eclientsocket_functions.htm>.

=over

=item L<Protocol::TWS::Request::calculateImpliedVolatility>

=item L<Protocol::TWS::Request::calculateOptionPrice>

=item L<Protocol::TWS::Request::cancelCalculateImpliedVolatility>

=item L<Protocol::TWS::Request::cancelCalculateOptionPrice>

=item L<Protocol::TWS::Request::cancelFundamentalData>

=item L<Protocol::TWS::Request::cancelHistoricalData>

=item L<Protocol::TWS::Request::cancelMktData>

=item L<Protocol::TWS::Request::cancelMktDepth>

=item L<Protocol::TWS::Request::cancelNewsBulletins>

=item L<Protocol::TWS::Request::cancelOrder>

=item L<Protocol::TWS::Request::cancelRealTimeBars>

=item L<Protocol::TWS::Request::cancelScannerSubscription>

=item L<Protocol::TWS::Request::exerciseOptions>

=item L<Protocol::TWS::Request::placeOrder>

=item L<Protocol::TWS::Request::replaceFA>

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

=item L<Protocol::TWS::Request::reqRealTimeBars>

=item L<Protocol::TWS::Request::reqScannerParameters>

=item L<Protocol::TWS::Request::reqScannerSubscription>

=item L<Protocol::TWS::Request::requestFA>

=item L<Protocol::TWS::Request::setServerLogLevel>

=back

=head1 RESPONSES

See L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/class_ewrapper_functions.htm>.

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

=head1 BUGS AND SUPPORT

Bugs are quite likely, as I did not try all requests/responses. If you find a
bug, please email me a code example together with a description what you expect
as result.

If you have any questions or suggestions feel free to email me as well.

Also, if you have any examples that I can include, I would appreciate it.

=head1 SEE ALSO

L<http://www.interactivebrokers.com/en/p.php?f=programInterface>,
L<http://www.interactivebrokers.com/php/apiUsersGuide/apiguide.htm#apiguide/c/c.htm>,
L<AnyEvent::TWS>, L<Finance::TWS::Simple>

=cut
