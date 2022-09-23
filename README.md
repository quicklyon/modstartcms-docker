<!-- 该文档是模板生成，手动修改的内容会被覆盖，详情参见：https://github.com/quicklyon/template-toolkit -->
# QuickOn ModStartCMS 应用镜像

[![GitHub Workflow Status](https://github.com/quicklyon/modstartcms-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/quicklyon/modstartcms/actions/workflows/docker.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/easysoft/modstartcms?style=flat-square)
![Docker Image Size](https://img.shields.io/docker/image-size/easysoft/modstartcms?style=flat-square)
![GitHub tag](https://img.shields.io/github/v/tag/quicklyon/modstartcms-docker?style=flat-square)

> 申明: 该软件镜像是由QuickOn打包。在发行中提及的各自商标由各自的公司或个人所有，使用它们并不意味着任何从属关系。

## 快速参考

- 通过 [渠成软件百宝箱](https://www.qucheng.com/app-install/install-modstart-<number>.html) 一键安装 **ModStartCMS**
- [Dockerfile 源码](https://github.com/quicklyon/modstartcms-docker)
- [ModStartCMS 源码](https://github.com/modstart/ModStartCMS)
- [ModStartCMS 官网](https://modstart.com/)

## 一、关于 ModStartCMS

<!-- 这里写应用的【介绍信息】 -->
`ModStartCMS` 是一个基于 `Laravel` 企业内容建站系统。模块市场拥有丰富的功能应用，支持后台一键快速安装，让开发者能快的实现业务功能开发。 

系统完全开源，基于 **Apache 2.0** 开源协议，**免费且不限制商业使用**。

![screenshots](https://raw.githubusercontent.com/quicklyon/modstartcms-docker/master/.template/screenshot.png)

ModStartCMS官网：[https://modstart.com/](https://modstart.com/)

<!-- 这里写应用的【附加信息】 -->
###  系统特性

- 全模块化开发，积木式搭建系统，可灵活组合
- 简洁优雅、灵活可扩展，可实现大型复杂系统
- 后台RBAC权限管理，多管理员多角色管理
- 丰富的数据表格、数据表单、数据详情功能
- 内置文件上传，无需繁琐的开发，支持云存储
- 丰富的模块市场，后台一键快速安装

- [ModStartCMS在线演示](https://cms.demo.tecmz.com)
- [模块市场](https://modstart.com/store)
- [源码地址 / Gitee](https://gitee.com/modstart/ModStartCMS)
- [源码地址 / GitHub](https://github.com/modstart/ModStartCMS)

## 二、支持的版本(Tag)

由于版本比较多,这里只列出最新的5个版本,更详细的版本列表请参考:[可用版本列表](https://hub.docker.com/r/easysoft/modstartcms/tags/)

## 三、获取镜像

<!-- 这里是镜像的【Tag】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->
- [latest](https://github.com/modstart/ModStartCMS/releases)
- [4.8.0-20220923](https://github.com/modstart/ModStartCMS/releases/tag/4.8.0)

推荐从 [Docker Hub Registry](https://hub.docker.com/r/easysoft/modstartcms) 拉取我们构建好的官方Docker镜像。

```bash
docker pull easysoft/modstart:latest
```

如需使用指定的版本,可以拉取一个包含版本标签的镜像,在Docker Hub仓库中查看 [可用版本列表](https://hub.docker.com/r/easysoft/modstartcms/tags/)

```bash
docker pull easysoft/modstart:[TAG]
```

## 四、持久化数据

如果你删除容器，所有的数据都将被删除，下次运行镜像时会重新初始化数据。为了避免数据丢失，你应该为容器提供一个挂在卷，这样可以将数据进行持久化存储。

为了数据持久化，你应该挂载持久化目录：

- /data 持久化数据

如果挂载的目录为空，首次启动会自动初始化相关文件

```bash
$ docker run -it \
    -v $PWD/data:/data \
docker pull easysoft/modstart:latest
```

或者修改 docker-compose.yml 文件，添加持久化目录配置

```bash
services:
  ModStartCMS:
  ...
    volumes:
      - /path/to/persistence:/data
  ...
```

## 五、环境变量

<!-- 这里写应用的【环境变量信息】 -->

<!-- 示例：

| 变量名           | 默认值        | 说明                             |
| ---------------- | ------------- | -------------------------------- |
| EASYSOFT_DEBUG   | false         | 是否打开调试信息，默认关闭       |
| MYSQL_HOST       | 127.0.0.1     | MySQL 主机地址                   |
| MYSQL_PORT       | 3306          | MySQL 端口                       |
| MYSQL_DB         | spug          | spug 数据库名称                 |
| MYSQL_USER       | root          | MySQL 用户名                      |
| MYSQL_PASSWORD   | pass4Spug     | MySQL 密码                        |
| REDIS_HOST       | 127.0.0.1     | Redis 服务地址 |
| REDIS_PORT       | 6379          | Redis 端口 |
| DEFAULT_ADMIN_USER| admin        | 默认管理员名称             |
| DEFAULT_ADMIN_PASSWORD | spug.dev | 默认管理员密码 |

-->

## 六、运行

### 6.1 单机Docker-compose方式运行

```bash
# 启动服务
make run

# 查看服务状态
make ps

# 查看服务日志
docker-compose logs -f modstartcms

```

<!-- 这里写应用的【make命令的备注信息】位于文档最后端 -->
<!-- 示例
**说明:**

- 启动成功后，打开浏览器输入 `http://<你的IP>:8080` 访问管理后台
- 默认用户名：`admin`，默认密码：`spug.dev`
-->
- [VERSION](https://github.com/quicklyon/modstartcms-docker/blob//VERSION) 文件中详细的定义了Makefile可以操作的版本
- [docker-compose.yml](https://github.com/quicklyon/modstartcms-docker/blob//docker-compose.yml)

## 七、版本升级

<!-- 这里是镜像的【版本升级】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->