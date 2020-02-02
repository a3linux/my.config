
1. Use Amazon Linux 2

2. Install packages and setup _ec2-user_ env

```
sudo yum update -y
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum update -y
sudo wget https://copr.fedorainfracloud.org/coprs/amonhuz/shadowsocks-libev/repo/epel-7/amonhuz-shadowsocks-libev-epel-7.repo -o /etc/yum.repos.d/amonhuz-shadowsocks-libev-epel-7.repo
sudo yum install -y shadowsocks-libev simple-obfs
mkdir -p ~/bin ~/etc/ss
```

3. Setup SS service from this folder.

* Copy the outputs/config-xxxx.json files to /home/ec2-user/etc/ss
* Copy the outputs/ss-xxx.service files to /usr/lib/systemd/system
* Enable the ss service by *sudo systemctl enable ss-xxxx.service*
* Reboot the system

4. Use the gen_qr.py to generate client configurations, including the QRcode pictures

