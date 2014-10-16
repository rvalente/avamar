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
* Ubuntu 12.04

* Puppet 3.6.2
* Facter 1.7.5
* EMC Avamar 6.12
* Windows Server 2012 R2

* Puppet 3.6.2 & 3.7.1
* Facter 1.7.5 & 2.2.0
* EMC Avamar 7.1
* Ubuntu 14.04

## Params
* **host** is mandatory
* **domain** defaults to "clients"
* **version** defaults to '6.1.100-402', should be the version of the Avamar agent you're using
* **local_dir** defaults to ''. if used, it should be the full path of the installer (only tested on windows !!)

## Usage

### Without Hiera

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

### With Hiera

Puppet:
```
node foo.domain.tld {
  include avamar
}
```

Hiera/YAML:
```
avamar::host: 'avamar.domain.tld'
avamar::domain: 'clients'
avamar::version: '7.1.100-370'
```


