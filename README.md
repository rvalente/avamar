# GST/Avamar

**Author:** Ronald Valente

**Email:** <rawn027@gmail.com>

**Contributor:** Jerome RIVIERE, Nicolas BRECHET

**Version:** 2.0.0

**LICENSE:** Apache License, Version 2.0


## Description

This module is used to deploy the Avamar Client to puppet nodes. 
Currently it has only been tested on:

* Ubuntu 12.04 LTS
* Ubuntu 14.04 LTS
* MS Windows Server 2012 R2

## Requirements
* [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) (v4.1.0)
* if on Linux :
 - [maestrodev-wget](https://github.com/maestrodev/puppet-wget) (master)
* if on Windows :
 - [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/powershell) (v1.0.3)

## Tested On
* Puppet 3.1.1
* Facter 1.7.1
* EMC Avamar 6.1

* Puppet 3.6.2
* EMC Avamar 6.12
* Windows Server 2012 R2

## Params
* **host** is mandatory
* **domain** defaults to "clients"
* **version** defaults to '6.1.100-402'
* **local_dir**     ## full path of the installer (only tested on windows !!)

## Usage

```
node foo.domain.tld {
  class { avamar:
    host        => 'avamar.domain.tld',
    domain      => 'clients',
    version     => '7.1.100-370'
  }
}
```

On Windows :
```
  class { 'avamar':
    host        => 'avamar.domain.tld',
    domain      => 'clients',
    local_dir   => "C:\\source\\AvamarClient-windows.msi",
  }

```
