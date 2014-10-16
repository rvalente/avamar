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
  $pkg_dir    = $avamar::params::pkg_dir,
  $avagent    = $avamar::params::avagent,
  $base       = $avamar::params::base,
  $local_dir  = $avamar::params::local_dir
) inherits avamar::params {
  # TODO: check if anchor is really needed (a long as we install the agent before registering...)
  include avamar::install, avamar::register
  anchor{'avamar::begin':} 
  -> Class['avamar::install']
  -> Class['avamar::register']
  -> anchor{'avamar::end':}
}
