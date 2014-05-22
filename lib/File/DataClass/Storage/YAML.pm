package File::DataClass::Storage::YAML;

use 5.01;
use namespace::sweep;
use version; our $VERSION = qv( sprintf '0.1.%d', q$Rev: 2 $ =~ /\d+/gmx );

use Moo;
use MooX::Augment -class;
use File::DataClass::Functions qw( extension_map );
use File::DataClass::Types     qw( Int );
use YAML::Tiny;

extends q(File::DataClass::Storage);

has '+extn'  => default => '.yml';

has 'stream' => is => 'ro', isa => Int, default => 0;

# Construction
extension_map 'YAML' => [ '.yml', '.yaml' ];

augment '_read_file' => sub {
   my ($self, $rdr) = @_; my $yt = YAML::Tiny->new;

   $self->encoding and $rdr->encoding( $self->encoding );

   return $yt->read_string( $rdr->all )->[ $self->stream ];
};

augment '_write_file' => sub {
   my ($self, $wtr, $data) = @_; my $yt = YAML::Tiny->new;

   $self->encoding and $wtr->encoding( $self->encoding );

   my $content = $wtr->exists ? $yt->read_string( $wtr->all ) : $yt;

   $content->[ $self->stream ] = $data; $wtr->print( $content->write_string );

   return $data;
};

1;

__END__

=pod

=encoding utf-8

=head1 Name

File::DataClass::Storage::YAML - Read/write data YAML storage model

=head1 Synopsis

   use Moo;

   extends 'File::DataClass::Schema';

   has '+storage_class' => default => 'YAML';

=head1 Description

Uses L<YAML::Tiny> to read and write YAML files

=head1 Configuration and Environment

Defines the following attributes;

=over 3

=item C<extn>

The default extension, F<.yml>

=item C<stream>

The YAML document number. Defaults to zero

=back

=head1 Subroutines/Methods

None

=head1 Diagnostics

None

=head1 Dependencies

=over 3

=item L<File::DataClass::Storage>

=item L<YAML::Tiny>

=back

=head1 Incompatibilities

There are no known incompatibilities in this module

=head1 Bugs and Limitations

There are no known bugs in this module. Please report problems to
http://rt.cpan.org/NoAuth/Bugs.html?Dist=File-DataClass-Storage-YAML.
Patches are welcome

=head1 Acknowledgements

Larry Wall - For the Perl programming language

=head1 Author

Peter Flanigan, C<< <pjfl@cpan.org> >>

=head1 License and Copyright

Copyright (c) 2014 Peter Flanigan. All rights reserved

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself. See L<perlartistic>

This program is distributed in the hope that it will be useful,
but WITHOUT WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

=cut

# Local Variables:
# mode: perl
# tab-width: 3
# End:
# vim: expandtab shiftwidth=3:
