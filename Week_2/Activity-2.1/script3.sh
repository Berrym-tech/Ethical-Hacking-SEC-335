#!/bin/bash

sudo nmap -n -vv -sn 10.0.5.2-50 -oG - | grep Up | cut -d ' ' -f 2 > sweep3.txt

