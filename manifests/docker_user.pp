# == Define: docker::docker_user
#
# Define to manage docker group users
#
define docker::docker_user {
  include docker::params
  user { $title:
    ensure => 'present',
    before => Exec['add_group'],
  }
  exec { 'add_group':
    command => "usermod -aG docker ${title}",
    unless  => "/bin/cat /etc/group | grep '^docker:' | grep -qw ${title}",
    require => Service[$docker::params::service],
    path    => '/usr/sbin:/usr/bin',
  }
}
