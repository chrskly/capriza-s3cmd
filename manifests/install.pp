# Class: s3cmd::install
#
class s3cmd::install (

    $pkgname = $s3cmd::params::pkgname,

) inherits s3cmd::params {

    case $::osfamily {
        'redhat': {
            file {'/etc/yum.repos.d/s3tools.repo':
                source => 'puppet:///modules/s3cmd/etc/yum.repos.d/s3tools.repo',
            }
            $s3cmd_require = File['/etc/yum.repos.d/s3tools.repo']
        }
        default: {
            $s3cmd_require = undef
        }
    }

    package { $pkgname :
        ensure  => installed,
        require => $s3cmd_require,
    }

    case $::operatingsystem {
        'FreeBSD': {
            $main_pkg_repo = hiera('main_pkg_repo')
            Pkgng::Repo[$main_pkg_repo]
            -> Package[$pkgname]
        }
    }

}
