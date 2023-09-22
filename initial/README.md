# btpanel-v7.7.0

btpanel-v7.7.0，官方原版v7.7.0版本面板备份

原库地址：https://github.com/zhucaidan/btpanel-v7.7.0  



#### 安装

Centos/Ubuntu/Debian 安装命令 独立运行环境(py3.7)


```Bash
curl -sSO https://raw.githubusercontent.com/GettionHub/baota/main/initial/install.sh && bash install.sh
```

```
# 受限于不同服务器不同的网络环境，如果执行失败可添加代理再次尝试
# example：
# https://gh.api.99988866.xyz/
# https://raw.kgithub.com/
```

附：[宝塔 Linux 命令指南](https://www.bt.cn/new/btcode.html)  



部分 Linux 命令备份

###### 1、关闭防火墙

```shell
# 停止FirewallD服务
systemctl stop firewalld
# 禁用FirewallD服务，以禁止FirewallD在系统启动时自动启动
systemctl disable firewalld
# 屏蔽FirewallD服务，将阻止防火墙被其他服务启动
systemctl mask --now firewalld
```

