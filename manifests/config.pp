# == Class: config
#
# Class configures repository configuration for Docker.
#
# === Parameters
# [*dockerrepo*]
#	The file name for the various package systems. Defaults 
#       to docker.repo.
class docker::config (
$dockerrepo = $docker::params::dockerrepo
) inherits docker::params {
  if $::osfamily == 'RedHat' {
    $path   = '/etc/yum.repos.d/docker.repo'
    $source = 'puppet:///modules/docker/docker.repo'
  } elsif $::operatingsystem == 'Ubuntu' {
    $path   = '/etc/apt/sources.list.d/docker.list'
    $source = "puppet:///modules/docker/docker.${::operatingsystemrelease}.list"
  } else {
    fail('OS version not supported.')
  }
  file { $dockerrepo:
    ensure => 'file',
    path   => $path,
    source => $source,
  }
}
