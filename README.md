# Packer

This repository contain [Packer](https://www.packer.io/) templates for building [Vagrant](https://www.vagrantup.com/) boxes customized by [Evolix](https://evolix.com/).

## Dependencies

Youd need make, packer and jq, on Debian you can install them with :

~~~
apt install make packer jq
~~~

## Build

For build *evolinux*, a Debian GNU/Linux Stretch base customized by Evolix :

~~~
make evolinux
~~~

Other make target are available, eg. *packmail*, an evolinux base + mail server (Postfix/Dovecot/Roundcube/...) :

~~~
make packmail
~~~

## License

This project is an [Evolix](https://evolix.com) project and is licensed under GPLv3, see the [LICENSE](LICENSE) file for details.
