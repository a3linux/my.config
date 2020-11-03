### A simple configuration for Squid + Privoxy + Tor

A simple sample for personal tor anonymous network with squid + privoxy proxy by basic authentication.

Tor is running at default configuration coming from Ubuntu(20.04 as tested).
Tor client should be listen on localhost:9050. 

Privoxy is forward socket5t to localhost tor and ONLY accept request from localhost;

Squid use privoxy as cache_peer and authentication with basic NCSA(Apache htpasswd is used to generate and manage the passwords in /etc/squid)
