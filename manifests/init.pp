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
  $host       = $avamar::params::host,
  $domain     = $avamar::params::domain,
  $version    = $avamar::params::version,
  $local_dir  = $avamar::params::local_dir
) inherits avamar::params {

  class {'avamar::install':}
  -> class {'avamar::register':}
  
  
}
