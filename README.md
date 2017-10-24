# Ansible Provisioning
## Introduction

Ansible is a neat tool to help provision servers with a specific configuration. We can use this tool to maintain our servers and ensure that everyone has an identical copy of a website for use with Vagrant running locally.

We can define things like:
 - PHP version
 - Specific server packages(e.g. for optimising images)
 - Creating cron tasks
 - Web server configuration and routing
 - And so, so much more!
 
## Setting up

#### Installing
If you're setting up Ansible from scratch or a brand new repository then you'll need to do a few things

1. You will need to [install Ansible](docs/Installing-Ansible#install).
2. You should [setup](docs/Setting-Up-This-Repository) this repository to work with your project
3. Then, look at [configuring Vagrant](docs/Configuring-Vagrant).
4. You may optionally want to look at configuring Ansible for other environments too
5. Lastly, you may want to look at configuring Ansible for the [deployment of code](docs/Deploying-With-Ansible).

### Upgrading

You can find upgrade instructions [here](docs/Installing-Ansible#upgrade).

## More about Ansible
To find out more about ansible

## Roles
Roles are specific sets of functionality within Ansible that can be executed via [Playbooks](ansible/Playbooks.md). For instance, a PHP role manages the installation and configuration of PHP upon your server. Ideally it should not need to know anything about others roles and other roles should not need to know about it (though this can be unavoidable at times).

Here is a list of the current roles available:

 - [Apache](roles/Apache.md)
 - [App](roles/App.md)
 - [Composer](roles/Composer.md)
 - [Database](roles/Database.md)
 - [Deploy](roles/Deploy.md)
 - [ElasticSearch](roles/ElasticSearch.md)
 - [NGINX](roles/NGINX.md)
 - [NTP](roles/NTP.md)
 - [PHP](roles/PHP.md)
 - [Selenium](roles/Selenium.md)
 - [Server](roles/Server.md)
 - [Unattended Upgrades](roles/Unattended-Upgrades.md)
 - [Vagrant](roles/Vagrant.md)
 - [Varnish](roles/Varnish.md)

## Playbooks
You can find out more about Playbooks [here](ansible/Playbooks.md).

## Group