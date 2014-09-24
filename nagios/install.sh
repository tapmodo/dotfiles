#!/bin/bash
cd `dirname $0`
cp -v check_* /usr/lib/nagios/plugins

chmod 755 /usr/lib/nagios/plugins/check_debian_packages
