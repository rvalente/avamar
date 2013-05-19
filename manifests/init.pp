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
  $avamar_host   = undef,
  $avamar_domain = 'clients',
) inherits avamar::params {
  include avamar::install, avamar::register
}
