# LDAP-Apache2 Docker Image

## Description

This is an image for someone who wants to use apache2 with ldap.

Maybe there are some public pages and private pages in your application, so the solution `ldap+apache2` will be a good choice.

In order to use it more easily, we uploaded the image to three independent image hosting platforms:

- [Docker Hub](https://hub.docker.com/r/zhonger/ldap-apache)
- [Quay.io](https://quay.io/repository/zhonger/ldap-apache)
- [Aliyun](https://registry.cn-shanghai.aliyuncs.com/zhonger/ldap-apache) (Shanghai)

## Features

- The basic function is to access private pages with ldap auth.
- This image also provide one-stop access, which means that we can unify many websites or document sites to the subdirectory of one domain.
- Considering the diversity of CPU arch nowadays, we provide 8 archs including amd64, i386, arm64 and so on.
- Other small features: log files persistence, www data persistence.

## How to use it

It's very easy to use it through `docker-compose` (**Recommend**).

```yaml
# docker-compose.yml

version: '3'

services:
    apache:
      image: zhonger/ldap-apache:latest
      volumes:
        # - ./apache2.conf:/etc/apache2/apache2.conf
        - ./data:/var/www/
        - ./logs:/var/log/apache2/
        - /etc/localtime:/etc/localtime
      environment:
        LDAP_URL: "ldap://ldap.example.com/ou=users,dc=example,dc=com?uid"
        LDAP_BindDN: "cn=admin,dc=example,dc=com"
        LDAP_BindPass: "xxxxxxxxxx"
        LDAP_BindGroup: "ou=people,dc=example,dc=com"
        APACHE_LOG_DIR: "/var/log/apache2"
      ports:
        - 80:80
      restart: always
```

```bash
docker-compose up -d
```

The `apache2.conf` is an option because it will overwrite the same file in the image. If you want to use rewrite or proxy mode, you need to use it.

## More

If you want to know more about the idea and details, you can refer to [《LDAP 集成之 Apache 篇》](https://lisz.me/tech/webmaster/ldap-apache.html). (Sorry, it's only Chinese now. In the future, we will provide English version.)

## 简介

这个镜像是为想要 apache2 和 ldap 一起使用的人准备的。

可能在你的应用场景里存在某些页面是公开的，某些是私密的（需要 ldap 认证鉴权），那么 ldap+apache2 的方案很适合你。

为了便于使用，我们将镜像上传到了三个独立的镜像托管平台：

- [Docker Hub](https://hub.docker.com/r/zhonger/ldap-apache)
- [Quay.io](https://quay.io/repository/zhonger/ldap-apache)
- [Aliyun](https://registry.cn-shanghai.aliyuncs.com/zhonger/ldap-apache) (上海)

## 特性

- 本镜像的基础功能是利用 ldap 进行鉴权来访问私密页面。
- 本镜像还提供了一站式接入的功能，即可以利用反向代理将多个站点或文档集成在同一个域名下面。
- 考虑现今 CPU 架构的多样性，本镜像支持包括 amd64、i386、arm64 等在内的 8 种架构。
- 其他小特性：日志持久化、数据持久化。

## 如何使用

通过 `docker-compose` 可以非常方便使用本镜像（**推荐**）。

```yaml
# docker-compose.yml

version: '3'

services:
    apache:
      image: zhonger/ldap-apache:latest
      volumes:
        # - ./apache2.conf:/etc/apache2/apache2.conf
        - ./data:/var/www/
        - ./logs:/var/log/apache2/
        - /etc/localtime:/etc/localtime
      environment:
        LDAP_URL: "ldap://ldap.example.com/ou=users,dc=example,dc=com?uid"
        LDAP_BindDN: "cn=admin,dc=example,dc=com"
        LDAP_BindPass: "xxxxxxxxxx"
        LDAP_BindGroup: "ou=people,dc=example,dc=com"
        APACHE_LOG_DIR: "/var/log/apache2"
      ports:
        - 80:80
      restart: always
```

```bash
docker-compose up -d
```

这里的 `apache2.conf` 文件挂载是一个可选项，因为一旦挂载，容器中的同名文件就会被覆盖。当然，如果你想要使用 rewrite 或者 proxy 功能，这就是必须的。

## 了解更多

关于本镜像的更多思考和详细步骤，请访问 [《LDAP 集成之 Apache 篇》](https://lisz.me/tech/webmaster/ldap-apache.html) 了解更多。