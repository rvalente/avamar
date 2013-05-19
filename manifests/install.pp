# == Class: avamar::install
# This will install the latest avamar client package.
# This class will use the avamar_host param from the main Avamar class.
#
# === Authors
# Ronald Valente <rawn027@gmail.com>
#
# === Copyright
# Copyright 2103 Ronald Valente
#
class avamar::install inherits avamar::params {
  include avamar
  include wget

  # Build the base_url
  $host     = $avamar::avamar_host
  $base_url = "https://${host}"
  $pkg_url  = "${base_url}${pkg_loc}"

  # Hostname must be a string
  validate_string($host)

  wget::fetch { "avamar_pkg":
    source      => "$pkg_url",
    destination => "${pkg_dir}/${pkg}",
    timeout     => 0,
    verbose     => false,
    checkssl    => false,
    notify      => Package[$pkg_name],
  }

  package { $pkg_name:
    provider => $provider,
    ensure   => installed,
    source   => "${pkg_dir}/${pkg}",
    require  => Wget::Fetch["avamar_pkg"],
  }
}
