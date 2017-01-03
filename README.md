Kyrat
=====

|Project Status|Communication|
|:-----------:|:-----------:|
|[![Build status](https://api.travis-ci.org/pearl-hub/kyrat.png?branch=master)](https://travis-ci.org/pearl-hub/kyrat) | [![Join the gitter chat at https://gitter.im/pearl-core/pearl](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pearl-core/pearl?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) |

**Table of Contents**
- [Description](#description)
- [Quickstart](#quickstart)
- [Installation](#installation)
- [Troubleshooting](#troubleshooting)

Description
===========

- name: `pearl`
- description: Wrapper of [kyrat](https://github.com/fsquillace/kyrat): SSH wrapper script that brings your dotfiles always with you on Linux and OSX
- author: Filippo Squillace
- username: fsquillace
- OS compatibility: linux, osx

Quickstart
==========
Take a look at the [kyrat](https://github.com/fsquillace/kyrat) documentation.

Installation
============
This package needs to be installed via [Pearl](https://github.com/pearl-core/pearl) system.

```sh
pearl install kyrat
```

`kyrat` from Pearl is a wrapper of the actual
[kyrat](https://github.com/fsquillace/kyrat) that attempts to include few
dotfiles and configurations from other Pearl packages. In order to get such
dotfiles transferred automatically by kyrat install any of the following packages:

```sh
pearl install sesaila dot-bash ops dot-vim
```

Dependencies
------------
The main dependencies are the following:

- [Pearl](https://github.com/pearl-core/pearl)
- [GNU coreutils](https://www.gnu.org/software/coreutils/)

Troubleshooting
===============
This section has been left blank intentionally.
It will be filled up as soon as troubles come in!
