# For Fedora Linux(Tested with F20)

## Install icedtea-web(Java plugin)

```
yum install icedtea-web 
```

## Install 32bit libraries

```
yum install xterm ld-linux.so.2 libstdc++.so.6 libz.so.1 libXext.so.6 libXrender.so.1 libXtst.so.6
```

## Install and config java 32bit JRE(Sun/Oracle one)

```
alternatives --install /bin/java java /jre/32bit/ 20000
alternatives --config java
alternatives --display java 
```


## Information from firefox console.
```

java version "1.7.0_51"
OpenJDK Runtime Environment (fedora-2.4.5.1.fc20-x86_64 u51-b31)
OpenJDK 64-Bit Server VM (build 24.51-b03, mixed mode)
Calling Super Init.
Command: /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.60-2.4.5.1.fc20.x86_64/jre/bin/java -d32 -version 2>&1 | grep "java version"
Is32BitPlugin: Uses 64 bit plugin. Res: null
Command = /bin/sh -c /sbin/alternatives --display java 2>&1 |grep -v "/bin/sh:" | grep ^/ | cut -d " " -f 1 | tr "
" " " 
Result = /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.60-2.4.5.1.fc20.x86_64/jre/bin/java /usr/local/java32/bin/java 
Java path = /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.60-2.4.5.1.fc20.x86_64/jre/bin/java
Command = /bin/sh -c /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.60-2.4.5.1.fc20.x86_64/jre/bin/java -d32 -version 2>&1 | grep "java version" 
Result = null
Java path = /usr/local/java32/bin/java
Command = /bin/sh -c /usr/local/java32/bin/java -d32 -version 2>&1 | grep "java version" 
Result = java version "1.7.0_51"
32 bit Java path = /usr/local/java32/bin/java
32 Bit Java Path = /usr/local/java32/bin/java
/root/.juniper_networks
Here is the standard output of the command:

Service needs to be installed for the first time
calling /root/.juniper_networks/network_connect/installNC.sh
Here is the standard error of the command (if any):

in get Proxy info..
linux_start_script= 
linux_end_script= 
notification_message= null
always_show_notification_msg= null
dnsSuffix= autodesk.com, ads.autodesk.com
para 0 is /usr/local/java32/bin/java
para 1 is -classpath
para 2 is /root/.juniper_networks/network_connect/NC.jar
para 3 is NC
para 4 is -h
para 5 is secure.autodesk.com
para 6 is -n
para 7 is 
para 8 is -t
para 9 is 
para 10 is -x
DSID=4318
Launching "/usr/local/java32/bin/java" "-classpath" "/root/.juniper_networks/network_connect/NC.jar" "NC" "-h" "secure.autodesk.com" "-n" "" "-t" "" "-x" 
Res: /usr/local/java32/bin/java -classpath /root/.juniper_networks/network_connect/NC.jar NC -h secure.autodesk.com -n  -t  -x
NOTE: child process received `Goodbye', closing down

```
