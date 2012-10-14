package Protocol::TWS::Response::commissionReport;

use strict;
use warnings;

use base 'Protocol::TWS::Response';

use Protocol::TWS::Struct::CommissionReport;


sub _id { 59 }

sub _meta {
    return (
        commissionReport => 'CommissionReport',
    );
}

sub _lines { 6 }

sub _parse {
    my ($class, $version, $data) = @_;

    my %commission_report = (
        execId              => $data->[0],
        commission          => $data->[1],
        currency            => $data->[2],
        realizedPNL         => $data->[3],
        yield               => $data->[4],
        yiedlRedemptionDate => $data->[5],
    );

    my %data = (
        commissionReport => Protocol::TWS::Struct::CommissionReport->new(%commission_report),
    );

    return $class->new(%data);
}

1;

