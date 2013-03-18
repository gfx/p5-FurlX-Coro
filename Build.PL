use strict;
use warnings FATAL => 'all';
use Module::Build::Pluggable qw(
  CPANfile
  GithubMeta
);

my $build = Module::Build::Pluggable->new(
    module_name => 'FurlX::Coro',

    license              => 'perl',
    recursive_test_files => 1,
    dynamic_config       => 0,
    configure_requires => {
        'Module::Build' => '0.40',
    },
    requires => {
        perl => '5.008001',
    },
    no_index             => {
        'directory' => [ 'example', 'inc', 't', 'xt' ]
    },

    test_files => ( -d '.git' || $ENV{RELEASE_TESTING} ) ? 't/ xt/' : 't/',

    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();
