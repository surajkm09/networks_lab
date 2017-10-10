#!/bin/bash

echo "set title  \"d vs b\";" > gnu.p
echo "set xlabel  \"bandwidth\";">>gnu.p 
echo "set ylabel \" packets dropped\" ;">>gnu.p
echo "plot 'cbr.d' with lines , 'tcp.d' with lines ;">>gnu.p
