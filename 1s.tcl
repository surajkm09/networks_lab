set ns [ new Simulator]
set f [open out.tr w]
$ns trace-all $f 
set namfile [open out.nam w ] 
$ns namtrace-all $namfile 
Agent/TCP set trace_all_online_ true

set n0 [$ns node ]
set n1 [$ns node ] 
set n2 [$ns node ]


$ns duplex-link $n0 $n1 [lindex $argv 0]Mb 5ms DropTail 
$ns duplex-link $n1 $n2 [lindex $argv 0]Mb 5ms DropTail
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n1 $n2 orient down
$ns queue-limit $n1 $n2 20 


set udp [new Agent/UDP]
$ns attach-agent $n0 $udp
set null [new Agent/Null]
$ns attach-agent $n2 $null
$ns connect $udp $null 
$udp set fid_ 0 
$ns color 0 blue 

set tcp [new Agent/TCP]
$ns attach-agent $n1 $tcp 
set sink [new Agent/TCPSink] 
$ns attach-agent $n2 $sink 
$ns connect $tcp $sink 
$tcp set fid_ 1
$ns color 1 red

set cbr [new Application/Traffic/CBR ]
$cbr attach-agent $udp
$cbr set packet size_ 500
$cbr set interval 0.001
 
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ftp set maxPkts_ 1000 

$ns at 1.0 "$cbr start"
$ns at 1.5 "$ftp start" 
$ns at 3.0 "$ftp stop"
$ns at 3.5 "$cbr stop" 
$ns at 4.0 "finish"
proc finish {} {
global ns f namfile 	
$ns flush-trace 	
close $f 
close $namfile 
exit 0 
}
$ns run 
