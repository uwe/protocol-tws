package Protocol::TWS::Request::reqScannerSubscription;

use strict;
use warnings;

use base 'Protocol::TWS::Request';


sub _id { 22 }

sub _meta {
    return (
        id           => {alias => 'tickerId'},
        subscription => 'ScannerSubscription',
    );
}

sub _response {
    return (
        scannerData    => 'cont',
        scannerDataEnd => 'end',
     );
}

sub _version { 3 }

sub _serialize {
    my ($self) = @_;

    my $subscription = $self->subscription;

    my @out = (
        $self->_id,
        $self->_version,
        $self->id,
        $subscription->numberOfRows             || '',
        $subscription->instrument               || '',
        $subscription->locationCode             || '',
        $subscription->scanCode                 || '',
        $subscription->abovePrice               || '',
        $subscription->belowPrice               || '',
        $subscription->aboveVolume              || '',
        $subscription->marketCapAbove           || '',
        $subscription->marketCapBelow           || '',
        $subscription->moodyRatingAbove         || '',
        $subscription->moodyRatingBelow         || '',
        $subscription->spRatingAbove            || '',
        $subscription->spRatingBelow            || '',
        $subscription->maturityAbove            || '',
        $subscription->maturityBelow            || '',
        $subscription->couponRateAbove          || '',
        $subscription->couponRateBelow          || '',
        $subscription->excludeConvertible       || '',
        $subscription->averageOptionVolumeAbove || '',
        $subscription->scannerSettingPairs      || '',
        $subscription->stockTypeFilter          || '',
    );

    return @out;
}


1;

