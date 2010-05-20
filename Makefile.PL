use ExtUtils::MakeMaker;

use YAML::Any qw(LoadFile);
my $file = "plugins/AutoPrefs/config.yaml";
my $version = LoadFile($file)->{version} ||
    die "No version found in $file";

WriteMakefile(
    NAME            => 'Auto Prefs',
    VERSION         => $version,
    DISTNAME        => 'AutoPrefs',
);
