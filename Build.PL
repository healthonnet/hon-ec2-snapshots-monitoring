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
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    add_to_cleanup     => [ 'HON-EC2-Snapshots-Monitoring-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
