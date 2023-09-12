#!/bin/bash

usage() {
  echo "usage: $0 <ip prefix> <dns_server>"
  exit 1
}

if [ "$#" -ne 2 ]; then
  usage
fi


network_prefix=$1
dns_server=$2
end=254

echo "dns resolution for 10.0.5"
for ((i=1;i<=end;i++)); do
  ip="$network_prefix.$i"
  nslookup $ip $dns_server | grep name
done
