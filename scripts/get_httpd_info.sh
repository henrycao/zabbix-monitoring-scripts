#!/bin/sh

get_memory_info(){
	ps aux | grep httpd | grep -v grep | awk '{sum+=$6}END{print sum/1024}'
}

get_cpu_info(){
	CPUNUM=`grep processor /proc/cpuinfo | wc -l`
	ps aux | grep httpd | grep -v grep | awk '{sum+=$3}END{print sum/'$CPUNUM'}'
}

get_child_process_num(){
        ps aux | grep httpd | grep -Ev 'grep|root' | wc -l
}

$1
