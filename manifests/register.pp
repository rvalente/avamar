# == Class: avamar::register
# This will register the client with the Avamar Grid.
# This requires that a host and a domain be provided.
#
# === Authors
# Ronald Valente <rawn027@gmail.com>
#
# === Copyright
# Copyright 2103 Ronald Valente
#
class avamar::register inherits avamar::params {

  case $::osfamily {
    'Windows': {
      exec { 'register':
        command     => "cd \"${avamar::params::pkg_path}\"; .\\avregister.bat \"${avamar::params::host}\" \"${avamar::params::domain}\";",
        refreshonly => true,
        subscribe   => Class['avamar::install'],
        provider    => 'powershell',
      }
      -> service { 'avbackup':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Class['avamar::install'],
      }
    }
    default: {
      exec { 'register':
        command     => "${avamar::params::avagent} register ${avamar::params::host} ${avamar::params::domain}",
        path        => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin' ],
        onlyif      => "test `${avamar::params::avagent} status | grep -c ${avamar::params::host}` -ne 1",
        refreshonly => true,
        subscribe   => Class['avamar::install'],
        before      => Service['avagent'],
      }

      service { 'avagent':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Class['avamar::install'],
      }
    }
  }
}
