# == Class: avamar::install
# This will install the latest avamar client package.
#
# === Authors
# Ronald Valente <rawn027@gmail.com>
#
# === Copyright
# Copyright 2103 Ronald Valente
#
class avamar::install inherits avamar::params {

  if($local_dir == ''){
    include wget
    $base_url  = "https://${host}"
    $pkg_url   = "${base_url}${pkg_loc}"
    # Hostname must be a string
    validate_string($host)

    wget::fetch { "avamar_pkg":
      source             => "$pkg_url",
      destination        => "${pkg_dir}/${pkg}",
      timeout            => 0,
      verbose            => false,
      nocheckcertificate => true,
      notify             => Package[$pkg_name],
    }

    package { $pkg_name:
      provider => $provider,
      ensure   => installed,
      source   => "${pkg_dir}/${pkg}",
      require  => Wget::Fetch["avamar_pkg"],
    }
  }else{
      package { "$pkg_name":
      ensure   => installed,
      source   => "$avamar::local_dir",
      install_options => ['/qn'],
    }
  }
}
