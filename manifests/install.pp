# == Class: install
#
# Class ensures package is installed from source. 
#
# === Parameters
# [*version*]
#       The version to install. Defaults to latest.
#
# [*package*]
#	The package name to install. Defaults to docker-engine.
#
# [*dockerrepo*]
#	The file name for the various package systems. Defaults 
#       to docker.repo.
class docker::install (
$version = $docker::params::version,
$package = $docker::params::package,
$dockerrepo = $docker::params::dockerrepo
) inherits docker::params {
  package { $package:
    ensure  => $version,
    require => File[$dockerrepo],
  }
}
