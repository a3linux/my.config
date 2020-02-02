{
    "server":["::0", "0.0.0.0"],
    "server_port":{{service_port}},
    "password":"{{service_password}}",
    "method": "aes-256-gcm",
    "timeout":600,
    "plugin": "obfs-server",
    "plugin_opts": "obfs=tls;obfs-host=www.bing.com"
}
