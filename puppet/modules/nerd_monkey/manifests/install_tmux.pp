class nerd_monkey::install_tmux {

  file { '/home/vagrant/.tmux.conf':
    ensure => present,
    source => '/vagrant/puppet/modules/nerd_monkey/files/tmux.conf',
    replace => true,
    require => File['/home/vagrant/bin']
  }

}
