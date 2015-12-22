use strict;
use warnings;

use IO::All;
use HON::EC2::Snapshots::Monitoring qw/findLogsOfTheDay/;

use Test::More tests => 3;


my @lines = io('t/resources/good-example.log')->slurp;
my @logs = findLogsOfTheDay(\@lines, '12-18-2015');

is(scalar(@logs), 28, 'number of lines');
like($logs[0], qr/12-18-2015/);
like($logs[scalar(@logs) - 1], qr/Backup\sdone/);
