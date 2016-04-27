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
class docker {
  include docker::config
  include docker::repository
  include docker::install
  include docker::service
}
