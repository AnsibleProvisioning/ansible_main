# Role | Vagrant
This section describes the Vagrant Role.
## Order of Execution
This role has no specific order of execution and can be included in your playbook at any position.

## Default Configuration
The default configuration for this role is as such:

```yaml
vagrant:
    vm:
        base_box: ubuntu/xenial64
        hostname: awesome.dev
        ip: 192.168.83.43
        memory: '2048'
        cpus: '2'
    synced_folders:
        1: { source: ./awesomeSrc, target: /var/www/awesome.dev }
        2: { source: ./exampleSrc, target: /var/www/example.dev }
```

####  vm
This section controls the configurations of the virtual machine.
###### base_box
This is the base Vagrant Box to use as a virtual machine. 

You can find boxes and their names [here](http://www.vagrantbox.es/).
###### hostname
The hostname of the machine.
###### ip
The IP Address to assign the virtual machine. Don't forget to update the [inventory](ansible/Inventory.md) file with this same IP.
###### memory
How much memory to assign to the virtual machine, in megabytes.
###### cpus
How many CPU cores to assign to the virtual machine.
#### synced_folders
This is a collection of folders that would be synced from the host machine to the guest machine. It has some of the following config parameters:
###### source
This is the folder on the host machine which will be mounted in the guest machine
###### target
This is the location of the mount within the guest machine
