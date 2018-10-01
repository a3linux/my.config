Quick ss setup
================

# Build Docker image

```bash
docker build .
docker tag <images-id> a3linux/goss
docker push a3linux/goss
```

# How to use

Run a basic server with the simplest *config.json*,

```bash
docker run -it --rm -p <server-port>:<server-port> -v ${dir-to-config.json}/config.json:/usr/local/bin/config.json a3linux/goss -c /usr/local/bin/config.json
```

Deamon run,
```bash
docker run -d --rm -p <server-port>:<server-port> -v ${dir-to-config.json}/config.json:/usr/local/bin/config.json a3linux/goss -c /usr/local/bin/config.json
```

