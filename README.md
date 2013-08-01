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

###userparameter_processor.conf  
you can set a key with parameter in zabbix gui,or modify this script to define process name directly.
Know that when you have several processors with the same name, like nginx workers, you could not identity with them.

##Template  
Use template on zabbix gui with 

    configuration -> Templates -> import

##scripts/mail.py

This is a mail script which can relay 163 mail.  
Add a new media type with this script in zabbix and you can easily sending alert mail.

##nginx_spreate_requests
This script is totally with the usage of [tsdb](opentsdb.net),which is a useful tool to watch http requests.
you should do the followings to use it:
1. set a crontab to this script with 1min 5min all of them is ok
2. modify the script, add the server ip and the hostname in zabbix. each server should have a different hostname.(must match in zabbix)
3. add an item with zabbix trapper in gui, key name should match the script
