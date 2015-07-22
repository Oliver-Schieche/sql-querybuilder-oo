#!perl
use strict;
use warnings;

use Module::Build 0.30;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.30"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => 0,
    "Module::Build" => "0.30"
  },
  "dist_abstract" => "Object oriented query builder",
  "dist_author" => [q(Oliver Schieche <schiecheo@cpan.org>)],
  "dist_name" => "SQL-QueryBuilder-OO",
  "dist_version" => "0.2.1",
  "license" => "gpl",
  "module_name" => "SQL::QueryBuilder::OO",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Data::Dumper" => 0,
    "Env" => 0,
    "File::Slurp" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "Try::Tiny" => 0,
    "WWW::Mechanize" => 0,
    "perl" => "5.008"
  },
  "script_files" => [],
  "test_requires" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0
  }
);


my %fallback_build_requires = (
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Module::Build" => "0.30",
  "Test::More" => 0
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
