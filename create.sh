#!/bin/bash 
echo "TitleText: performance analysis(bandwidth vs packet dropped)">out.xg
echo "XUnitText: Bandwidth (in Mbps)">>out.xg
echo "YUnitText: number of packets dropped">>out.xg
echo "">>out.xg
echo "\"CBR\"">>out.xg
cat $1>>out.xg
echo "">>out.xg
echo "\"TCP\"">>out.xg
cat $2>>out.xg

