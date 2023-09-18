#!/bin/bash

for suf in $(seq 2 50);

	do
	 ping -W 2 -c 1 10.0.5.$suf | grep '64 bytes from' | cut -d " " -f 4 | tr -d ":"

done > sweep.txt
