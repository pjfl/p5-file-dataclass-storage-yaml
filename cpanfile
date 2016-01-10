requires "File::DataClass" => "v0.63.0";
requires "Moo" => "2.000001";
requires "YAML::Tiny" => "1.67";
requires "namespace::autoclean" => "0.26";
requires "perl" => "5.01";

on 'build' => sub {
  requires "Module::Build" => "0.4004";
  requires "Test::Requires" => "0.06";
  requires "version" => "0.88";
};

on 'test' => sub {
  requires "File::Spec" => "0";
  requires "Module::Metadata" => "0";
  requires "Sys::Hostname" => "0";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "Module::Build" => "0.4004";
  requires "version" => "0.88";
};
