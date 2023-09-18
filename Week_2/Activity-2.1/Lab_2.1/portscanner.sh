#!/bin/bash

usage() {
  echo "usage: $0 <hostfile> <portfile>"
  exit 1
}

if [ $# -ne 2 ]; then
  usage
fi

hostfile=$1
portfile=$2

if [ ! -f "$hostfile" ] || [ ! -f "$portfile" ]; then
  echo "Error: Hostfile or portfile does not exist."
  usage
fi

echo "host,port,status"

while IFS= read -r host; do
  while IFS= read -r port; do
    if timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null; then
      status="Open"
    else
      status="Closed"
    fi
    echo "$host,$port,$status"
  done < "$portfile"
done < "$hostfile"
