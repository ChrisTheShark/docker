# == Class: service
#
# Class ensures the Docker deamon is running. 
#
# === Parameters
# [*service*]
#	The service name to start. Defaults to docker.
#
# [*package*]
#	The package name to install. Defaults to docker-engine.
class docker::service (
$service = $docker::params::service,
$package = $docker::params::package
) {
  service { $service:
    ensure  => 'running',
    require => Package[$package],
  }
}
