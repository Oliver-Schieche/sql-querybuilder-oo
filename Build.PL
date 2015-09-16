#!/usr/bin/perl
use strict;
use warnings;

use Module::Build 0.30;


my %module_build_args = (
  'build_requires' => {
    'Module::Build' => '0.30'
  },
  'configure_requires' => {
    'ExtUtils::MakeMaker' => 0,
    'Module::Build' => '0.30'
  },
  'dist_abstract' => 'Object oriented query builder',
  'dist_author' => [q(Oliver Schieche <schiecheo@cpan.org>)],
  'dist_name' => 'SQL-QueryBuilder-OO',
  'dist_version_from' => 'lib/SQL/QueryBuilder/OO.pm',
  'license' => 'perl',
  'module_name' => 'SQL::QueryBuilder::OO',
  'requires' => {
    'perl' => '5.010'
  },
  'script_files' => [],
  'test_requires' => {
  	'Test::Perl::Critic' => 0
  }
);


my %fallback_build_requires = (
  'Module::Build' => '0.30'
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
