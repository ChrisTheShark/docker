# == Class: params
#
# Parameter class sets reasonable defaults. 
#
class docker::params {
  $version = 'latest'
  $dockerrepo = 'docker.repo'
  $package = 'docker-engine'
  $service = 'docker'
}
