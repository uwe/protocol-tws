#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;

use IO::Select;
use IO::Socket::INET;

use lib 'lib';
use Protocol::TWS;


# connect
my $socket = IO::Socket::INET->new(
    PeerAddr => '192.168.2.53:7496',
    Proto    => 'tcp',
) or die 'no socket';

my $select = IO::Select->new($socket);

# client version
_send($socket, 59);

# server version
my $server_version = _recv($socket);

if ($server_version >= 20) {
    my $time = _recv($socket);
}

# client id
_send($socket, 0);

while ($select->can_read(5)) {
    my $id = _recv($socket);
    my $response = Protocol::TWS->response_by_id($id);
    die "Unknown ID '$id'" unless $response;
    my @lines = ();
    foreach (1 .. $response->lines) {
        push @lines, _recv($socket);
    }
    ###TODO###
}


sub _send {
    my ($socket, $data) = @_;

    say "SEND: '$data'";

    $socket->send($data . "\0");
}

sub _recv {
    my ($socket) = @_;

    local $/ = "\0";
    my $data = $socket->getline;
    $data =~ s/\0$//;

    say "RECV: '$data'";

    return $data;
}

