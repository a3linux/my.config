Quick How To
===============

## Requirement

1. An VPS host with CoreOS, now ONLY tested in CoreOS as everyting comes with Docker
2. Login in with **core** user

## Add service

1. Copy or clone this folder, e.g. put it into /home/core/service
2. Create the *config* folder like this,
```
mkdir -p /home/core/ss
```
2. Run add_service.sh <port-number> to add a new SS service
```
./add_service.sh 54321
```
3. Run docker command to check the service is running,
```
docker ps
```
4. Check the password in /home/ss/config-<port-number>.json
```
cat /home/core/ss/config-54321.json
```

Enjoy it and create as many as you want!
