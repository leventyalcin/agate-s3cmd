# documentation
class s3cmd (
  $aws_access_key,
  $aws_secret_key,
  $user,
  $package_provider = 'pip',
  $gpg_passphrase   = undef,
)
{
  class{'s3cmd::install':
    package_provider => $package_provider,
  } ->
  class{'s3cmd::config':
      aws_access_key => $aws_access_key,
      aws_secret_key => $aws_secret_key,
      user           => $user,
      gpg_passphrase => $gpg_passphrase,
      require        => Class['s3cmd::install'],
  }
}
