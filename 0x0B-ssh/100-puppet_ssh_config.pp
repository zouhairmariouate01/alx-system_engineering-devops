# Setting up my client config file

include stdlib

file { '/etc/ssh/ssh_config':
  ensure  => file,
  mode    => '0600',
  owner   => 'root',
  group   => 'root',
  content => template('ssh/ssh_config.erb'),
}

File { '/root/.ssh':
  ensure => directory,
  mode   => '0700',
}

File { '/root/.ssh/config':
  ensure  => file,
  mode    => '0600',
  owner   => 'root',
  group   => 'root',
  content => template('ssh/ssh_config.erb'),
}

File { '/root/.ssh/school':
  ensure  => file,
  mode    => '0600',
  owner   => 'root',
  group   => 'root',
  source  => 'puppet:///modules/ssh/school',
}

ssh_config { 'root':
  ensure => present,
  user   => 'root',
  host   => 'your_server_address',
  identityfile => '/root/.ssh/school',
  passwordauthentication => false,
}
