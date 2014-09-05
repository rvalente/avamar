# GST/Avamar

**Author:** Ronald Valente
**Email:** <rawn027@gmail.com>

**Contributor:** Jerome RIVIERE
**Version:** 1.1.0

**LICENSE:** Apache License, Version 2.0





## Description
This module is used to deploy the Avamar Client to puppet nodes. Currently I have only tested it on Ubuntu 12.04 LTS.

Tested on windows server 2012 R2

## Requirements
* [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) (v4.1.0)
* if linux :
 - [maestrodev-wget](https://github.com/maestrodev/puppet-wget) (master)
* if windows :
 - [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/powershell) (v1.0.3)

## Tested On
* Puppet 3.1.1
* Facter 1.7.1
* EMC Avamar 6.1

* Puppet 3.6.2
* EMC Avamar 6.12
* Windows Server 2012 R2

## Params
* **avamar_host**
* **avamar_domain**
* **local_dir**     ## full path of the installer (only tested on windows !!)

## Usage
```
node foo.domain.tld {
  class { avamar:
    avamar_host        => 'avamar.domain.tld',
    avamar_domain      => 'clients',
    nocheckcertificate => true,
  }
}
```
On Windows :
```
  class { 'avamar':
    avamar_host        => 'avamar.domain.tld',
    avamar_domain      => 'clients',
    local_dir          => "C:\\source\\AvamarClient-windows.msi",
  }

```
