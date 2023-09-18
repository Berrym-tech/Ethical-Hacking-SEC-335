#!/bin/bash

start_ip="10.0.5.2"
end_ip="10.0.5.50"

check_ip() {
    ip="$1"
    if ping -c 1 -W 1 "$ip" >/dev/null 2>&1; then
        echo "$ip"
        echo "$ip" >> sweep.txt
    fi
}

ip_to_long() {
    local ip="$1"
    local a b c d
    IFS=. read -r a b c d <<< "$ip"
    echo $((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))
}

start=$(ip_to_long "$start_ip")
end=$(ip_to_long "$end_ip")

for ((ip_int = start; ip_int <= end; ip_int++)); do
    ip=$(printf "%d.%d.%d.%d\n" "$((ip_int >> 24 & 255))" "$((ip_int >> 16 & 255))" "$((ip_int >> 8 & 255))" "$((ip_int & 255))")
    check_ip "$ip" &
done
