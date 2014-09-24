#!/bin/bash

NAGIOS_PLUGINS=/usr/lib/nagios/plugins

install_plugin() {
	cp -v "${1}" "${NAGIOS_PLUGINS}"
	chmod 755 "${NAGIOS_PLUGINS}/${1}"
}

cd `dirname $0`

install_plugin check_debian_packages
install_plugin check_docker
install_plugin check_mongodb

