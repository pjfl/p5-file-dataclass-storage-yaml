use t::boilerplate;

use File::Spec::Functions qw( catfile );
use Test::More;
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
