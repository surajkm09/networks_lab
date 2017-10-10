#!/bin/bash
touch tcp.d cbr.d
rm tcp.d cbr.d
touch tcp.d cbr.d
for i in $(seq 0.1 $2 2)
{
	ns $1 $i
	./cd.sh out.tr $i 
}
./gnucreate.sh
gnuplot gnu.p
