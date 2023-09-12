#!/bin/bash

usage() {
  echo "usage: $0 <ip address> <port>"
  exit 1
}

if [ "$#" -ne 2 ]; then
  usage
fi

ip=$1
port=$2
end=254

echo "ip:port"
for ((i=1;i<=end;i++)); do
  addresses="$ip.$i"
  timeout .1 bash -c "echo >/dev/tcp/$addresses/$port" 2>/dev/null &&
    echo "$addresses:$port"
done
