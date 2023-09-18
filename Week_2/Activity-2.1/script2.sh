#!/bin/bash

for suf in $(seq 2 50);
	do
	fping -a -t 1 10.0.5.$suf
done > sweep2.txt
