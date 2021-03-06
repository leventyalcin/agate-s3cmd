# documentation

class s3cmd::config (
  $aws_access_key,
  $aws_secret_key,
  $user,
)
{
  $config_file = $user ? {
    'root' => '/root/.s3cfg',
    default => "/home/${user}/.s3cfg",
  }

  file { $config_file:
    ensure  => present,
    mode    => '0600',
    owner   => $user,
    content => template('s3cmd/s3cfg.erb')

  }
}
