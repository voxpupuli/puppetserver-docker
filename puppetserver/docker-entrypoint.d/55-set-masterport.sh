#!/bin/bash

set -e

hocon() {
  /opt/puppetlabs/puppet/lib/ruby/vendor_gems/bin/hocon "$@"
}

if test -n "$PUPPETSERVER_PORT"; then
  cd /etc/puppetlabs/puppetserver/conf.d/
  hocon -f webserver.conf set webserver.ssl-port $PUPPETSERVER_PORT
  cd /
  puppet config set serverport $PUPPETSERVER_PORT --section main
fi
