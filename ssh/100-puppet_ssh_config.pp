# File: 100-puppet_ssh_config.pp

# Ensure SSH client configuration file exists
file { '/etc/ssh/ssh_config':
  ensure => present,
}

# Configure SSH client to use the private key ~/.ssh/school
file_line { 'Declare identity file':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/school',
  match   => '^#?IdentityFile\s.*$',
}

# Configure SSH client to refuse password authentication
file_line { 'Turn off passwd auth':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => '^#?PasswordAuthentication\s.*$',
}

