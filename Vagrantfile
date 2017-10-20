require 'yaml'

# Gets the path of this file
dir = File.dirname(File.expand_path(__FILE__))

# Gets our vagrant.yml config
configValues = YAML.load_file("#{dir}/ansible-config/group_vars/vagrant.yml")

# Gets the data values of the config
data = configValues['vagrant']

# Require this Vagrant version
Vagrant.require_version '>= 2.0.0'

# Require these plugins to be installed
required_plugins = %w( vagrant-bindfs )                                          #  Plugin names, space separated list
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin    # Install missing plugins
end

# Run the configuration and server
Vagrant.configure("2") do |config|

    # Configure the VM
    config.vm.box = "#{data['vm']['base_box']}"                         # The box config
    config.vm.network :private_network, ip: "#{data['vm']['ip']}"       # IP
    config.ssh.forward_agent = true                                     # SSH forwarding
    config.vm.define :"#{data['vm']['hostname']}" do |t|                # Set the hostname of the server
    end

    # Configure VirtualBox
    config.vm.provider :virtualbox do |vb|
        vb.name = "#{data['vm']['hostname']}"                           # Server hostname
        vb.memory = "#{data['vm']['memory']}"                           # Set the RAM value
        vb.cpus = "#{data['vm']['cpus']}"                               # Set the CPU core count
        vb.customize [
            "modifyvm", :id,                                            # VM ID
            "--natdnshostresolver1", "on",                              # Enable NAT
            "--nictype1", "virtio"                                      # Use a VirtualIO NIC type
        ]
    end

    # Configure the Ansible provisioner
    config.vm.provision "ansible" do |ansible|
        ansible.config_file = 'ansible/ansible.cfg'                         # Ansible config location
        ansible.compatibility_mode = '2.0'                                  # Minimum Ansible version
        ansible.playbook = "ansible-config/playbooks/vagrant-playbook.yml"  # Playbook
        ansible.inventory_path = "ansible-config/inventory.yml"             # Inventory
        ansible.limit = 'all'                                               # Ansible limit groups
    end

    # Sync folders on the host machine into the guest machine using NFS
    data['synced_folders'].each do |i, folder|
        # Set the owner and group of the synced folders
        if folder['source'] != '' && folder['target'] != ''
            sync_owner = !folder['owner'].nil? ? folder['owner'] : "#{data['vm']['box_user']}"
            sync_group = !folder['group'].nil? ? folder['group'] : 'www-data'

            # Sync folders using vagrant-bindfs to ensure permissions are consistant
            config.vm.synced_folder "#{folder['source']}", "/mnt/vagrant-#{i}",
            id: "#{i}",
            type: 'nfs'

            config.bindfs.bind_folder "/mnt/vagrant-#{i}", "#{folder['target']}",
            force_user: sync_owner,
            force_group: sync_group,
            perms: "u=rwX:g=rwX:o=rD",
            o: 'nonempty'
        end
    end
end
