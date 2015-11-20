# documentation
#
class s3cmd::install (
    $package_provider
){

  if ( ! defined( Package['python-pip'] ) ) {
    package { 'python-pip':
      ensure => 'installed',
    }
  }

  file { '/usr/bin/pip-python':
    ensure  => 'link',
    target  => '/usr/bin/pip',
    require => Package['python-pip'],
  }

  package { 's3cmd':
      ensure   => 'installed',
      provider => $package_provider,
  }

}
