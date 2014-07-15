class nerd_monkey::install_app {

  file { '/home/vagrant/bin/setup_native.sh':
    ensure => present,
    mode => 775,
    source => '/vagrant/puppet/modules/nerd_monkey/files/setup_native.sh',
    replace => true,
    require => File['/home/vagrant/bin']
  }


  file { '/home/vagrant/nerd_monkey':
    ensure => symlink,
    target => '/vagrant'
  }

  file { '/vagrant/config/database.yml':
    ensure => present,
    source => '/vagrant/config/database.yml.dist',
    replace => false
  }

  file { '/home/vagrant/README.md':
    ensure => present,
    source => '/vagrant/puppet/modules/nerd_monkey/files/README.md',
    replace => true
  }

  file { '/home/vagrant/.bashrc':
    ensure => present,
    source => '/vagrant/puppet/modules/nerd_monkey/files/bashrc',
    replace => true
  }
}
