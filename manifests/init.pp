define cloudwatchlogs (
  $state_file = $::cloudwatchlogs::params::state_file
) {
  
  file { '/etc/awslogs':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  concat { '/etc/awslogs/awslogs.conf':
    ensure         => 'present',
    owner          => 'root',
    group          => 'root',
    mode           => '0644',
    ensure_newline => true,
    warn           => true,
    require        => File['/etc/awslogs'],
  }

  concat::fragment { 'awslogs-header':
    target  => '/etc/awslogs/awslogs.conf',
    content => template('cloudwatchlogs/awslogs_header.erb'),
    order   => '00',
  }
}