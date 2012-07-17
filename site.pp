node default {

  class { 'couchdb':
    bind => '0.0.0.0',
  }

  class { 'elasticsearch':
    bind_host => '0.0.0.0',
  }

  elasticsearch::plugin { 'couchdb-river':
    username  => 'elasticsearch',
    repo_name => 'elasticsearch-river-couchdb',
  }
}