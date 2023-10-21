
# 版本区别
文件夹为独立版本与根目录版本毫无关联，仅备份留存
- crack      破解版
- initial    官方原版
- local      本地版
------
镜像仓库地址：[https://hub.docker.com/r/gettionhub/baota-docker](https://hub.docker.com/r/gettionhub/baota-docker)

代码仓库地址：[https://github.com/gettionhub/baota](https://github.com/gettionhub/baota)

------

# 宝塔面板7.7安装脚本&优化补丁

### 宝塔面板7.7优化版安装脚本

1. 优化：去除无用接口、减少无用代码执行、减少对于宝塔云端请求、去除面板广告等，保持面板干净清爽。

2. 修复：兼容新版本面板运行环境、修复面板XSS高危漏洞。


* Github链接（若无法访问请重试或使用加速器）
```bash
wget -O install.sh https://raw.githubusercontent.com/GettionHub/baota/main/install_6.0_mod.sh && bash install.sh
```
- 通用jsdelivr加速链接：
```bash
wget -O install.sh https://cdn.jsdelivr.net/gh/GettionHub/baota/install_6.0_mod.sh && bash install.sh
```
- 国内jsdelivr加速链接：
```bash
wget -O install.sh https://gcore.jsdelivr.net/gh/GettionHub/baota/install_6.0_mod.sh && bash install.sh
```

### 宝塔面板7.7优化补丁

1. 去除宝塔面板强制绑定账号
2. 去除各种删除操作时的计算题与延时等待
3. 去除创建网站自动创建的垃圾文件（index.html、404.html、.htaccess）
4. 关闭未绑定域名提示页面，防止有人访问未绑定域名直接看出来是用的宝塔面板
5. 关闭活动推荐与在线客服，去除首页企业版广告
6. 去除自动校验文件与上报信息定时任务
7. 去除面板日志与网站绑定域名上报

* Github链接（若无法访问请重试或使用加速器）
```bash
wget -O optimize.sh https://raw.githubusercontent.com/GettionHub/baota/main/optimize_mod.sh && bash optimize.sh
```
- 通用jsdelivr加速链接：
```bash
wget -O optimize.sh https://cdn.jsdelivr.net/gh/GettionHub/baota/optimize_mod.sh && bash optimize.sh
```
- 国内jsdelivr加速链接：
```bash
wget -O optimize.sh https://gcore.jsdelivr.net/gh/GettionHub/baota/optimize_mod.sh && bash optimize.sh
```
* 如果Ngnix创建的网站出现403 forbidden(保留网站创建的文件，若无法访问请重试或使用加速器）
```bash
wget -O optimize.sh https://raw.githubusercontent.com/GettionHub/baota/main/optimize_mod_fixngnix.sh && bash optimize.sh
```
- 通用jsdelivr加速链接：
```bash
wget -O optimize.sh https://cdn.jsdelivr.net/gh/GettionHub/baota/optimize_mod_fixngnix.sh && bash optimize.sh
```
- 国内jsdelivr加速链接：
```bash
wget -O optimize.sh https://gcore.jsdelivr.net/gh/GettionHub/baota/optimize_mod_fixngnix.sh && bash optimize.sh
```

### 卸载宝塔面板

- Github链接（若无法访问请重试或使用加速器）

```shell
wget -O bt-uninstall.sh https://raw.githubusercontent.com/GettionHub/baota/main/bt-uninstall.sh && bash bt-uninstall.sh
```
- 通用jsdelivr加速链接：
```shell
wget -O bt-uninstall.sh https://cdn.jsdelivr.net/gh/GettionHub/baota/bt-uninstall.sh && bash bt-uninstall.sh
```
- 国内jsdelivr加速链接：
```shell
wget -O bt-uninstall.sh https://gcore.jsdelivr.net/gh/GettionHub/baota/bt-uninstall.sh && bash bt-uninstall.sh
```
### 破解教程
1、解除面板时间限制

（1）资管管理器
依次进入 /www/server/panel/data/ 目录，然后双击编辑 plugin.json 文件

（2）刷新目录
注意：如果找不到 www 目录，请刷新系统跟目录

（3）定位文件

（4）编辑 plugin.json
- FinalShell 集成了编辑器，双击该文件即可打开进行编辑内容
- Ctrl + F 打开搜索框
- 查找："endtime": -1
- 替换为："endtime": 999999999999
- 点击全部替换按钮
- 文本内容不小 查询需要时间 稍等片刻即有反馈
- 点击 OK 按钮 关闭 查找/替换 窗口 Ctrl + S 保存即可

2、解除面板版本授权

（1）编辑器继续操作
- 操作还是在上面已打开的文件中
- /www/server/panel/data/plugin.json 文件
- 在上面操作完成后没有关闭编辑器的同学，可继续在该界面操作
- 如果关闭了，则定位到文件，重新打开编辑即可

（2）编辑 plugin.json
- Ctrl + F 打开搜索框
- 查找：is_user_status
- 点击查找按钮
- 请移动 查找/替换 窗口，防止窗口盖住查找内容
- 观察查找内容，代码颜色不太明显，需详细查看
- 关闭 查找/替换 窗口
- 将 “ltd”: -1 和 “pro”: -1 这两个 -1 都改为 0
- 解释：ltd 是企业版，pro 是专业版；-1 表示暂无授权，0 表示专业版永久授权
- Ctrl + S 保存内容，关闭编辑器即可

3、授权文件进行保护
回到执行命令部分 复制命令 直接回车即可
```
chattr +i /www/server/panel/data/plugin.json
```
- 没有异常表示命令执行成功

----

需要解除则输入以下命令
```
chattr -i /www/server/panel/data/plugin.json
```
-----
