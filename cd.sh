#!/bin/bash
no_cbr=$(grep d $1|grep -c cbr)
no_tcp=$(grep d $1|grep -c tcp)
echo "$2 $no_tcp">>tcp.d
echo "$2 $no_cbr">>cbr.d
