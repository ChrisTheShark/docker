# == Class: repository
#
# Class configures repository data and settings. 
#
# === Parameters
# [*package*]
#	The package name to install. Defaults to docker-engine.
class docker::repository (
$package = $docker::params::package
) inherits docker::params {
  if $::osfamily == 'RedHat' {
    exec { 'yum_update':
      command => 'yum update -y',
      path    => '/usr/bin',
      before  => Package[$package],
      unless  => '/usr/bin/test -f /usr/bin/docker',
    }
  } elsif $::osfamily == 'Debian' {
    exec { 'addDockerKey':
      command => 'apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D',
      path    => '/bin/:/usr/bin/',
      before  => Package[$package],
      unless  => '/usr/bin/test -f /usr/bin/docker',
    }
    exec { 'apt_update':
      command => 'apt-get update -y',
      path    => '/usr/bin',
      before  => Package[$package],
      require => Exec['addDockerKey'],
      unless  => '/usr/bin/test -f /usr/bin/docker',
    }
  }
}
