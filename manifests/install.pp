# documentation
#
class s3cmd::install (
    $package_provider
){

  package { 's3cmd':
      ensure   => 'installed',
      provider => $package_provider,
  }

}
