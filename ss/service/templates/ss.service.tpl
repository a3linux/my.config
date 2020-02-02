[Unit]
Description=Shadowsocks Service {{service_port}}
After=network.target
[Service]
PermissionsStartOnly=True
User=ec2-user
Group=ec2-user
ExecStart=/usr/bin/ss-server -c /home/ec2-user/etc/ss/config-{{service_port}}.json -u
Restart=on-abort
[Install]
WantedBy=multi-user.target
