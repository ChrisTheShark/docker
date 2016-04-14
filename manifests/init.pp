# == Class: docker
#
# Module to install an up-to-date version of Docker from package.
#
# === Parameters
# [*dockerrepo*]
#	The file name for the various package systems. Defaults 
#       to docker.repo.
#
# [*package*]
#	The package name to install. Defaults to docker-engine.
#
# [*service*]
#	The service name to start. Defaults to docker.
class docker(
  $dockerrepo = $docker::params::dockerrepo,
  $package = $docker::params::package,
  $service = $docker::params::service
) inherits docker::params {
  class { 'docker::config':
    dockerrepo => $dockerrepo,
  }
  class { 'docker::repository':
    package => $package,
  }
  class { 'docker::install':
    package    => $package,
    dockerrepo => $dockerrepo,
  }
  class { 'docker::service':
    service => $service,
    package => $package,
  }
}
