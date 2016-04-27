# == Class: install
#
# Class ensures package is installed from source. 
#
# === Parameters
# [*package*]
#	The package name to install. Defaults to docker-engine.
#
# [*dockerrepo*]
#	The file name for the various package systems. Defaults 
#       to docker.repo.
class docker::install (
$package = $docker::params::package,
$dockerrepo = $docker::params::dockerrepo
) inherits docker::params {
  package { $package:
    ensure  => 'latest',
    require => File[$dockerrepo],
  }
}
