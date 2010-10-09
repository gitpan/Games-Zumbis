
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;

use File::ShareDir::Install;
install_share dist => "share";


my %WriteMakefileArgs = (
  'ABSTRACT' => 'How long can you survive in a zombies attack',
  'AUTHOR' => 'Breno G. de Oliveira <garu@cpan.org>, Daniel Ruoso <ruoso@cpan.org>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31',
    'File::ShareDir::Install' => '0.03'
  },
  'DISTNAME' => 'Games-Zumbis',
  'EXE_FILES' => [
    'bin/zumbis'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'Games::Zumbis',
  'PREREQ_PM' => {
    'Carp' => '1.0',
    'File::ShareDir' => '1.02',
    'FindBin' => '1.0',
    'Getopt::Long' => '2.35',
    'Mouse' => '0.64',
    'Path::Class' => '0.19',
    'Pod::Usage' => '1.32',
    'SDL' => '2.510',
    'XML::Compile' => '1.16'
  },
  'VERSION' => '0.04',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

package
MY;
use File::ShareDir::Install qw(postamble);


