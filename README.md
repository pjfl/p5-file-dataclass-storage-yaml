# Name

File::DataClass::Storage::YAML - Read/write data YAML storage model

# Synopsis

    use Moo;

    extends 'File::DataClass::Schema';

    has '+storage_class' => default => 'YAML';

# Description

Uses [YAML::Tiny](https://metacpan.org/pod/YAML::Tiny) to read and write YAML files

# Configuration and Environment

Defines the following attributes;

- `extn`

    The default extension, `.yml`

- `stream`

    The YAML document number. Defaults to zero

# Subroutines/Methods

## read\_from\_file

Returns a hash reference decoded from the files contents

## write\_to\_file

Writes a hash reference to file in YAML format

# Diagnostics

None

# Dependencies

- [File::DataClass](https://metacpan.org/pod/File::DataClass)
- [YAML::Tiny](https://metacpan.org/pod/YAML::Tiny)

# Incompatibilities

There are no known incompatibilities in this module

# Bugs and Limitations

There are no known bugs in this module. Please report problems to
http://rt.cpan.org/NoAuth/Bugs.html?Dist=File-DataClass-Storage-YAML.
Patches are welcome

# Acknowledgements

Larry Wall - For the Perl programming language

# Author

Peter Flanigan, `<pjfl@cpan.org>`

# License and Copyright

Copyright (c) 2014 Peter Flanigan. All rights reserved

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself. See [perlartistic](https://metacpan.org/pod/perlartistic)

This program is distributed in the hope that it will be useful,
but WITHOUT WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE
