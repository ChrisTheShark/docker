# == Class: params
#
# Parameter class sets reasonable defaults. 
#
class docker::params {
  $dockerrepo = 'docker.repo'
  $package = 'docker-engine'
  $service = 'docker'
}
