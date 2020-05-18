# Setting up Ansible with a new Repository
If you are setting up a brand new repository and want to use Ansible to enhance your project there are a few precursors

### Installing
#### Submodule
This project is designed to be used as a Git Submodule.

Perform the following commands from the root of your project directory
```bash
git submodule add -b master git@github.com:AnsibleProvisioning/ansible_main.git ansible
git submodule update --init --recursive
```

#### First install
This script will copy some blank template files in place for you, create a symlink for the Vagrantfile and create any folders you will need:
```bash
./ansible/install/bin/install.sh
```

### Updating
To update the ansible repo, which you will need to do from time to time, you can simply run the update script:-
```bash
./ansible/install/bin/update.sh
```
