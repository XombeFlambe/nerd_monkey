class { "nerd_monkey::packages": require => Stage["main"] }
class { "nerd_monkey::install_postgresql": require => Class["nerd_monkey::packages"] }
class { "nerd_monkey::install_ruby": require => Class["nerd_monkey::install_postgres"] }
class { "nerd_monkey::install_app": require => Class["nerd_monkey::install_ruby"] }
class { "nerd_monkey::install_nginx": require => Class["nerd_monkey::install_app"] }

class nerd_monkey {
  Exec {
    path => ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']
  }

  group { 'puppet':
    ensure => present,
  }

  group { 'vagrant':
    ensure => present
  }

  user { 'vagrant':
    ensure => present,
    home => '/home/vagrant',
    gid => 'vagrant',
    shell => '/bin/bash',
    require => Group['vagrant']
  }

  file { '/home/vagrant':
    ensure => directory,
    owner => 'vagrant',
    group => 'vagrant',
    mode => 0750,
    require => User['vagrant']
  }

  group { 'nerd_monkey':
    ensure => present
  }

  user { 'nerd_monkey':
    ensure => present,
    home => '/home/nerd_monkey',
    gid => 'nerd_monkey',
    shell => '/bin/bash',
    require => Group['nerd_monkey']
  }

  file { '/home/nerd_monkey':
    ensure => directory,
    owner => 'nerd_monkey',
    group => 'nerd_monkey',
    mode => 0750,
    require => User['nerd_monkey']
  }

  file { '/home/vagrant/bin':
    ensure => directory,
    require => File['/home/vagrant']
  }

  group { 'nerdery':
    ensure => present
  }

  user { 'nerdery':
    ensure => present,
    home => '/home/nerdery',
    gid => 'nerdery',
    shell => '/bin/bash',
    groups => ['sudo'],
    require => Group['nerdery']
  }

  file { '/home/nerdery':
    ensure => directory,
    owner => 'nerdery',
    group => 'nerdery',
    mode => 0750,
    require => User['nerdery']
  }

  exec { 'update-locale':
    command => 'update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8',
  }

  class { 'timezone':
    timezone => 'America/Chicago',
  }

  include packages
  
  include install_postgresql
  
  
  
  include install_ruby
  
  
  include install_app
  
  
  
  
  
  include install_tmux
  
  
  include install_vim
  
}
