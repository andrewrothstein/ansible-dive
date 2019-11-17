andrewrothstein.dive
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-dive.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-dive)

Installs [dive](https://github.com/wagoodman/dive).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.dive
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
