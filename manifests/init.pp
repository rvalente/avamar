# == Class: avamar
# This will install the latest avamar client package.
# It requires that a Avamar host be provided but will default to 'clients'
# for the domain just as the avregister agent does.
#
# === Authors
# Ronald Valente <rawn027@gmail.com>
#
# === Copyright
# Copyright 2103 Ronald Valente
#
class avamar (
    $host       = undef,
    $domain     = 'clients',
    $version    = '6.1.100-402',
    $local_dir  = ''
) {
  class {'avamar::params':
    host      => $host,
    domain    => $domain,
    version   => $version,
    local_dir => $local_dir,
  } ->
  class {'avamar::install':
  } -> 
  class {'avamar::register':
  }
}
