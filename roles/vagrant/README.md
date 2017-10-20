## Order of Execution
This role has no specific order of execution and can be included in your playbook at any position.
## Template
This is a template for adding new PECL extensions. This is not really configurable.

The default template looks like the following and uses Jinja2 for the templating engine:
```bash
; Configuration for php PECL {{ item }} extension
extension={{ item }}.so

```
## Default Configuration
The default configuration for this role is as such:
```yaml
---
php:
    install: false
    version: 7.0 # 5.5, 5.6, 7.0
    packages: []
    pecl_packages: []
```
#####  install
This decides whether or not to install this package.
##### version
The version of PHP to install.
##### packages
The PHP packages to install, in this format:
```yaml
    packages:
        - cli
        - intl
```
##### pecl_packages
PECL packages to install in this format:
```yaml
    packages:
        - Crypt_GPG
```
