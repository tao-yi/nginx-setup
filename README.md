# 负载均衡

## L4 Load Balancing

主要工作于处于 OSI 模型中间位置的传输层 Transport Layer。

它主要处理消息的传递，而不管消息的内容。在互联网上，TCP 就是 HTTP 传输方式的四层协议( Layer 4 Protocol )。四层负载均衡只针对由上游服务发送和接收的网络包，而并不检查包内的具体内容是什么。

## L7 Load Balancing

主要工作于处于 OSI 模型顶层位置的应用层 Application Layer。它主要处理每条消息中的真正内容。在互联网上，HTTP 是网络通讯中占据主导地位的七层协议( Layer 7 Protocol )。一个七层负载均衡器终止网络传输并读取消息中的内容。它可以基于消息中内容( 比如 URL 或者 cookie 中的信息 )来做出负载均衡的决定。

# Nginx

Nginx 有一个主进程和多个工作进程。

- 主进程负责读取配置，管理工作进程
- 工作进程负责处理请求

Nginx 采用时间驱动的模型，依赖操作系统的底层机制来高效的分发请求给 worker process。

工作进程的数量取决于配置文件和可用的 CPU 数量。

nginx 的配置文件位于 `/usr/local/nginx/conf`, `/etc/nginx`, or `/usr/local/etc/nginx`.

```sh
# 启动nginx
$ nginx
# 快速关闭
$ nginx -s stop
# graceful shutdown
$ nginx -s quit
# 重新加载配置文件
$ nginx -s reload

# 查看nginx进程，可以看到1个master，两个worker
$ ps aux | grep nginx
root     27468  0.0  0.0  40356   952 ?        Ss   18:35   0:00 nginx: master process nginx
nginx    27469  0.0  0.0  42828  1952 ?        S    18:35   0:00 nginx: worker process
nginx    27470  0.0  0.0  42828  1952 ?        S    18:35   0:00 nginx: worker process
```
