use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'HON::EC2::Snapshots::Monitoring',
    license             => 'gpl_2',
    dist_author         => q{William Belle <william.belle@gmail.com>},
    dist_version_from   => 'lib/HON/EC2/Snapshots/Monitoring.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'IO::All'     => 0.86,
        'Time::Piece' => 1.31,
    },
    meta_merge => {
        resources => {
            repository => 'https://github.com/healthonnet/hon-ec2-snapshots-monitoring',
        },
    },
    add_to_cleanup     => [ 'HON-EC2-Snapshots-Monitoring-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
