class nerd_monkey::install_postgresql {
  $pg_databases = ['nerd_monkey_dev', 'nerd_monkey_test', 'nerd_monkey_prod']

  class { 'postgresql::server': }
  class { 'postgresql::server::contrib': }
  class { 'postgresql::client': }
  class { 'postgresql::lib::devel': }

  postgresql::server::role { "vagrant":
    password_hash => postgresql_password('vagrant', 'abcd1234'),
    superuser => true
  }

  postgresql::server::db { $pg_databases:
    user => 'vagrant',
    password => postgresql_password('vagrant', 'abcd1234')
  }
}
