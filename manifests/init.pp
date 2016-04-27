# == Class: docker
#
# Module to install an up-to-date version of Docker from package.
#
class docker {
  include docker::config
  include docker::repository
  include docker::install
  include docker::service
}
