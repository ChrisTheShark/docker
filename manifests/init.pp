# == Class: docker
#
# == Parameters
# [*version*]
#       The version to install. Defaults to latest.
#
# Module to install an up-to-date version of Docker from package.
#
class docker (
$version = $docker::params::version
) inherits docker::params {
  include docker::config
  include docker::repository
  class { 'docker::install':
    version => $version,
  }
  include docker::service
}
