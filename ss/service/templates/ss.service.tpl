[Unit]
Description=Shadowsocks Service {{service_port}}
[Service]
User=core
ExecStartPre=-/usr/bin/docker kill ss-{{service_port}}
ExecStartPre=-/usr/bin/docker rm ss-{{service_port}}
ExecStartPre=/usr/bin/docker pull a3linux/goss
ExecStart=/usr/bin/docker run --rm --name ss-{{service_port}} -m 16M -v /home/core/ss/config-{{service_port}}.json:/tmp/config.json -v /var/log:/var/log --publish {{service_port}}:{{service_port}} a3linux/goss -c /tmp/config.json
ExecStop=/usr/bin/docker stop ss-{{service_port}}
[Install]
WantedBy=multi-user.target
