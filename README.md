# GST/Avamar

**Author:** Ronald Valente

**Email:** <rawn027@gmail.com>

**Version:** 1.0.0

**LICENSE:** Apache License, Version 2.0


## Description
This module is used to deploy the Avamar Client to puppet nodes. Currently I have only tested it on Ubuntu 12.04 LTS.

## Requirements
* [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) (v4.1.0)
* [maestrodev-wget](https://github.com/maestrodev/puppet-wget) (master)

## Tested On
* Puppet 3.1.1
* Facter 1.7.1
* EMC Avamar 6.1

## Params
* **avamar_host**
* **avamar_domain**

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
