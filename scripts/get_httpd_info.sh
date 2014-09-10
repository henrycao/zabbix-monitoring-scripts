#!/bin/sh

get_memory_info(){
	ps aux | grep httpd | grep -v grep | awk '{sum+=$6}END{print sum/1024}'
}

get_cpu_info(){
	CPUNUM=`grep processor /proc/cpuinfo | wc -l`
	ps aux | grep httpd | grep -v grep | awk '{sum+=$3}END{print sum/'$CPUNUM'}'
}

$1
