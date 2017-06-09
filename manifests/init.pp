# Class: s3cmd
#
class s3cmd (

    $aws_access_key,
    $aws_secret_key,
    $gpg_passphrase,
    $owner,

)
{
    class{'s3cmd::install':}
    class{'s3cmd::config':
        aws_access_key => $aws_access_key,
        aws_secret_key => $aws_secret_key,
        gpg_passphrase => $gpg_passphrase,
        owner          => $owner,
        require        => Class['s3cmd::install'],
    }

}
