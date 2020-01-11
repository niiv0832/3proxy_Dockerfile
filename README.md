# Container with socks5 proxy server based on 3proxy.

docker run --name=3proxyserv -d -v $YOUR_PATH_TO_CONFIG_DIR$:/etc/3proxy/cfg -v $YOUR_PATH_TO_LOG_DIR$:/var/log/3proxy -p $YOUR_PORT1$:80 -p $YOUR_PORT2$:81 -p $YOUR_PORTn$:82 -t niiv0832/3proxy_server:latest
