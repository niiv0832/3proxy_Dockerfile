# Container with socks5 proxy server based on 3proxy.

## Links:

Link on docker hub: <a href="https://hub.docker.com/r/niiv0832/3proxy_server">niiv0832/3proxy_server</a>

Link on github: <a href="https://www.github.com/niiv0832/3proxy_Dockerfile">niiv0832/3proxy_Dockerfile</a>

## Usage

```shell
docker run --name=3proxyserv --restart=always -d -v $YOUR_PATH_TO_CONFIG_DIR$:/etc/3proxy/cfg -v $YOUR_PATH_TO_LOG_DIR$:/var/log/3proxy -p $YOUR_PORT1$:80 -p $YOUR_PORT2$:81 -p $YOUR_PORTn$:82 -t niiv0832/3proxy_server:latest
```
