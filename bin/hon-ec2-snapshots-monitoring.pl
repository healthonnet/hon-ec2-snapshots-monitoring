#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;

use IO::All -utf8;
use Time::Piece;

use HON::EC2::Snapshots::Monitoring qw/findLogsOfTheDay isLogOk/;

=head1 NAME - hon-ec2-snapshots-monitoring.pl

Monitor EC2 snapshots log

=head1 SYNOPSIS

  hon-ec2-snapshots-monitoring.pl --help

  hon-ec2-snapshots-monitoring.pl --log=/path/to/file.log

=head1 ARGUMENTS

=over 2

=item --log=/path/to/file.log

path to the log file

=back

=cut

my ( $log, $help );
GetOptions(
  "log=s" => \$log,
  "help"  => \$help,
)
|| pod2usage(2);

if ( $help || !$log ) {
  pod2usage(1);
  exit(0);
}

my $time  = Time::Piece->new;
my @lines = io($log)->slurp;
my @todayLogs = findLogsOfTheDay(\@lines, $time->mdy);
if (isLogOk(@todayLogs)){
  print 'exit(0)', "\n";
  exit(0);
} else {
  print 'exit(1)', "\n";
  exit(1);
}
