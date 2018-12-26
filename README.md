# Packer

This repository contains [Packer](https://www.packer.io/) templates
for building [Vagrant](https://www.vagrantup.com/) boxes customized
by [Evolix](https://evolix.com/).

## Dependencies

make(1), [packer](https://www.packer.io/) and
[jq](https://stedolan.github.io/jq/), on Debian you can install
them with :

~~~
apt install make packer jq
~~~

## Build

To build *evolinux*, a Debian GNU/Linux Stretch base customized by
Evolix :

~~~
make evolinux
~~~

Other make targets are available, eg. *packmail*, an evolinux base
setup with a mail server (Postfix/Dovecot/Roundcube/...) :

~~~
make packmail
~~~

## License

This is an [Evolix](https://evolix.com) project and is licensed
under the GPLv3, see the [LICENSE](LICENSE) file for details.
