### 宝塔 7.7 面板备份 &amp; 解除部分功能限制 & 纯本地版

##### **考虑到不同地区网络环境不同，以及可能有在本地虚拟机搭建的需求，对原脚本进行了修改，将面板相关文件改为本地加载，避免因网络环境干扰搭建失败**

ps：其他依赖，如 python 等依旧需要联网安装

pps：后续使用，安装运行环境等依旧需要联网  



1、克隆/下载当前项目到本地

2、将`local`文件夹上传到服务器根目录

3、依次执行以下命令执行安装脚本

```shell
# 进入 install 文件夹
cd /local/install
# 执行安装脚本
bash install.sh
# 合并执行
cd /local/install && bash install.sh
```

4、执行优化脚本

```shell
# 进入 crack 文件夹
cd /local/crack
# 赋予可执行权限,仅第一次需要
chmod +x crack.sh
# 执行优化
bash crack.sh
# 合并执行
cd /local/crack && chmod +x crack.sh && bash crack.sh
```

5、删除相关文件(可选)

```shell
rm -rf /local
```

附：[宝塔 Linux 命令指南](https://www.bt.cn/new/btcode.html)