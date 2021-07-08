# == Class: avamar::params
# This class is used to determine which package to use for each OS.
# Currently I have built in logic to support many distros but have
# only tested Debian based distros.
#
# === Authors
# Ronald Valente <rawn027@gmail.com>
#
# === Copyright
# Copyright 2103 Ronald Valente
#
class avamar::params (
  $host,
  $domain,
  $version,
  $local_dir,
) {

  $pkg_dir    = '/usr/local/src'
  $avagent    = '/usr/local/avamar/etc/avagent.d'
  $base       = 'AvamarClient'

  case $::osfamily {
    'RedHat': {
      $provider = 'rpm'
      $install_options = '-U'
      $type     = 'rpm'
      case $::lsbmajdistrelease {
        /(4|5)/: {
          case $::architecture {
            'i386': {
              $pkg_name = "${base}-${version}.i386"
              $pkg      = "${base}-linux-rhel4-x86-${version}.${type}"
              $pkg_loc  = "/DPNInstalls/downloads/RHEL5/${pkg}"
            }
            default: {
              $pkg_name = "${base}-${version}.x86_64"
              $pkg      = "${base}-linux-rhel4-x86_64-${version}.${type}"
              $pkg_loc  = "/DPNInstalls/downloads/RHEL5-X86_64/${pkg}"
            }
          }
        }
        '6': {
          case $::architecture {
            'i386': {
              $pkg_name = "${base}-${version}.i386"
              $pkg      = "${base}-linux-sles11-x86-${version}.${type}"
              $pkg_loc  = "/DPNInstalls/downloads/RHEL6/${pkg}"
            }
            default: {
              $pkg_name = "${base}-${version}.x86_64"
              $pkg      = "${base}-linux-sles11-x86_64-${version}.${type}"
              $pkg_loc  = "/DPNInstalls/downloads/RHEL6-X86_64/${pkg}"
            }
          }
        }
        default: {
          $pkg_name = "${base}-${version}.x86_64"
          $pkg      = "${base}-linux-sles11-x86_64-${version}.${type}"
          $pkg_loc  = "/DPNInstalls/downloads/RHEL${::lsbmajdistrelease}-X86_64/${pkg}"
        }
      }
    }
    'Suse': {
      $provider = 'rpm'
      $install_options = undef
      $type     = 'rpm'
      case $::lsbmajdistrelease {
        '10':{
          case $::architecture {
            'i386': {
              $pkg_name = "${base}-${version}.i386"
              $pkg      = "${base}-linux-rhel4-x86-${version}.${type}"
              $pkg_loc  = "/DPNInstalls/downloads/SLES10/${pkg}"
            }
            default: {
              $pkg_name = "${base}-${version}.x86_64"
              $pkg      = "${base}-linux-rhel4-x86_64-${version}.${type}"
              $pkg_loc  = "/DPNInstalls/downloads/SLES10-X86_64/${pkg}"
            }
          }
        }
        default:{
          case $::architecture {
            'i386': {
              $pkg_name = "${base}-${version}.i386"
              $pkg      = "${base}-linux-sles11-x86-${version}.${type}"
              $pkg_loc  = "/DPNInstalls/downloads/SLES11/${pkg}"
            }
            default: {
              $pkg_name = "${base}-${version}.x86_64"
              $pkg      = "${base}-linux-sles11-x86_64-${version}.${type}"
              $pkg_loc  = "/DPNInstalls/downloads/SLES11-X86_64/${pkg}"
            }
          }
        }
      }
    }
    'Solaris': {
      $provider = 'sun'
      $install_options = undef
      $type     = 'pkg'
      case $::architecture {
        'i386': {
          $pkg      = "${base}-solaris10-x86-${version}.${type}"
          $pkg_loc  = "/DPNInstalls/downloads/SOL5.10_X86/${pkg}"
        }
        default: {
          $pkg      = "${base}-solaris10-x86_64-${version}.${type}"
          $pkg_loc  = "/DPNInstalls/downloads/SOL5.10_X86_64/${pkg}"
        }
      }
    }
    'Debian': {
      $provider = 'dpkg'
      $install_options = undef
      $pkg_name = 'avamarclient-debian'
      $type     = 'deb'
      case $::architecture {
        'i386': {
          $pkg     = "${base}-debian4.0-x86-${version}.${type}"
          $pkg_loc = "/DPNInstalls/downloads/DEBIAN_LINUX/${pkg}"
        }
        default: {
          $pkg     = "${base}-debian4.0-x86_64-${version}.${type}"
          $pkg_loc = "/DPNInstalls/downloads/DEBIAN_LINUX_64/${pkg}"
        }
      }
    }
    'Windows': {
      $provider = 'windows'
      $install_options = undef
      $type     = 'msi'
      $pkg_name = 'EMC Avamar for Windows'
      case $::architecture {
        'amd64': {
          $pkg      = "${base}-windows-x86_64-${version}.${type}"
          $pkg_loc  = "/DPNInstalls/downloads/WIN64/${pkg}"
          $pkg_path = "C:\\Program Files\\avs\\bin\\"
        }
        'x64': {
          $pkg      = "${base}-windows-x86_64-${version}.${type}"
          $pkg_loc  = "/DPNInstalls/downloads/WIN64/${pkg}"
          $pkg_path = "C:\\Program Files\\avs\\bin\\"
        }
        'x86': {
          $pkg     = "${base}-windows-x86-${version}.${type}"
          $pkg_loc = "/DPNInstalls/downloads/WIN32/${pkg}"
          $pkg_path = "C:\\Program Files (x86)\\avs\\bin\\"
        }
        default: {
          fail("Module ${module_name} is not supported on ${::osfamily} ${::architecture}")
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }
}
