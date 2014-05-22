use strict;
use warnings;
use File::Spec::Functions qw( catdir catfile updir );
use FindBin               qw( $Bin );
use lib               catdir( $Bin, updir, 'lib' );

use Test::More;
use Test::Requires { version => 0.88 };
use Module::Build;

my $notes = {}; my $perl_ver;

BEGIN {
   my $builder = eval { Module::Build->current };
      $builder and $notes = $builder->notes;
      $perl_ver = $notes->{min_perl_version} || 5.008;
}

use Test::Requires "${perl_ver}";
use Text::Diff;

use_ok 'File::DataClass::IO';
use_ok 'File::DataClass::Schema';

my $path   = catfile( qw( t default.yml ) );
my $schema = File::DataClass::Schema->new
   ( path => $path, storage_class => 'YAML', tempdir => 't' );
my $dumped = catfile( qw( t dumped.yml ) ); io( $dumped )->unlink;

$schema->dump( { data => $schema->load, path => $dumped } );

my $diff = diff $path, $dumped;

ok !$diff, 'Load and dump roundtrips'; io( $dumped )->unlink;

done_testing;

# Local Variables:
# mode: perl
# tab-width: 3
# End:
# vim: expandtab shiftwidth=3:
