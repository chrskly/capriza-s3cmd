# Class: s3cmd::params
#
class s3cmd::params {

    case $::osfamily {
        'FreeBSD': {
            $pkgname = 'py27-s3cmd'
        }
        default: {
            $pkgname = 's3cmd'
        }
    }

}
