# == Define: docker::docker_user
#
# Define to manage docker group users
#
define docker::docker_user {
  include docker::params
  user { $title:
    ensure     => 'present',
    managehome => true,
    before     => Exec['add_group'],
  }
  exec { 'add_group':
    command => "usermod -aG docker ${title}",
    require => Package[$docker::params::package],
    path    => '/usr/sbin:/usr/bin',
  }
}
