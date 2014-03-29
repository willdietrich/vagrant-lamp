class mongodb {
  package { 'mongodb':
    ensure => latest,
  }

  service { 'mongodb':
    ensure => running,
    require => Package['mongodb'],
  }

  exec { 'mongo-php':
    command => 'pecl install mongo',
    creates => '/usr/lib/php5/20090626/mongo.so',
    require => Package['mongodb'],
  }
}
