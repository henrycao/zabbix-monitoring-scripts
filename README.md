zabbix-monitoring-scripts
=========================

Some zabbix monitoring scripts in use

##Where to put the configure?  
Usually we put these configure in `$path/etc/zabbix.agentd.conf.d/`  
Make sure you have include this path in `$path/etc/zabbix.agent.conf`  

##Use zabbix start stop script  

	ln -s $path/script/zabbix_server /etc/init.d/
	ln -s $path/script/zabbix_agentd /etc/init.d/

Then you can use the start stop script easily

##What should do next? 
Make sure your zabbix user have the sudo authorication.   
After you have put these scripts on you monitoring server, you should login to the zabbix-gui to configure them.  
Add these monitoring item in your zabbix.  


##What is the usage of these scripts?  
###userparameter_diskio.conf  
The data source is from /proc/stat, sleep in 2 seconds to calculate the diskio  

###userparameter_lvs.conf
This script can get which one is lvs master and get the mount of lvs active and inactive connections  

###userparameter_memcached.conf
This script provids a lot of args which can be used here. Things like:  
`$ telnet localhost 11211`  
`$ STATS`

###userparameter_mysql.conf
Make sure you have put one configure file in /var/lib/zabbix/.my.cnf  
put something like the following:  
`[client]`  
`port            = 3306`  
`socket          = /tmp/mysql.sock`  
`default-character-set= utf8`  
`user            = monitor`  
`password        = monitor`  

###userparameter_redis.conf
This is just like what we have done in memcached.  
It is the `$ INFO` command

###userparameter_nginx.conf
You can get the nginx accepts, handled, requests, active, reading, writing, waiting from this script.  
Make sure you have already have the nginx_sub_status module.  
Configure the right path to the script used in this conf. The script is in `scripts/nginx`.  
