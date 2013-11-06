#!/bin/bash
ADDR=$(ifconfig | grep inet | sed -e /inet6/d -e /127.0.0.1/d | head -n 1 | sed 's/[^0-9]*\([0-9.][0-9.]*\).*$/\1/')

NCPU=$1
if [[ $1 -eq "" ]]; then
    NCPU=0
fi
echo 'NCPU='$NCPU
erl -pa ebin -name slave@$ADDR -boot start_sasl -s dcbc_app -dcbc working_mode slave \
    -dcbc cbc_path  "\"$PWD/c_src/cbc_port\"" -dcbc registry_node `cat registry-node` -dcbc num_cpu $NCPU
