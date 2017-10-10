set title  "d vs b";
set xlabel  "bandwidth";
set ylabel " packets dropped" ;
plot 'cbr.d' with lines , 'tcp.d' with lines ;
