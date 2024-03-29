node default {

  class { 'couchdb':
    bind => '0.0.0.0',
  }

  class { 'elasticsearch':
    bind_host => '0.0.0.0',
    require   => Class['couchdb'],
  }

  elasticsearch::plugin { 'couchdb-river':
    username  => 'elasticsearch',
    repo_name => 'elasticsearch-river-couchdb',
    version   => '1.1.0',
  }
}