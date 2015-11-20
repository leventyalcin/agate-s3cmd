# documentation

class s3cmd::commands::get (
  $source_file = undef,
  $dest_file   = undef,
  $user        = undef,
  $type        = 'sync', # sync|get
)
{

  $config_file = $user ? {
    'root' => '/root/.s3cfg',
    default => "/home/${user}/.s3cfg",
  }

  exec { "get ${source_file}":
    command => "s3cmd -c ${config_file} ${type} ${source_file} ${dest_file}",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    require => Class['s3cmd::config'],
  }
}
