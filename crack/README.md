### 宝塔 7.7 优化脚本 建议用本地版



#### 安装

ps：本脚本仅用于 7.7 版本宝塔的优化，不保证对其他版本兼容性。非 7.7 版本使用请自行做好备份

```bash
wget -O crack.sh https://raw.githubusercontent.com/GettionHub/baota/main/crack/crack.sh && chmod +x crack.sh && ./crack.sh
```

#### 恢复

```
在终端运行宝塔面板命令，选择修复即可
进入堡塔命令行工具箱：bt

或者直接运行：bt 16
```



部分插件注意事项

###### 1、企业版插件 - 企业级备份，不要装该插件，安装后打开有可能会自动修复环境，导致优化失败

ps：其他插件自测，收费插件安装前建议快照备份，以防万一

###### 2、专业版插件 - Nginx防火墙，安装后在侧边栏打开会提醒 `APP被您禁用啦`，修复方法：

```js
将 /www/server/panel/plugin/btwaf/static/js/baiduMap.js 内容替换为：
(function(){window.HOST_TYPE = "2"; window.BMap_loadScriptTime = (new Date).getTime(); document.write('<script type="text/javascript" src="https://api.map.baidu.com/reverse_geocoding/v3/?ak=Ikd2A16tuZY9jviM4wRNkO2Tu3DT5lwK&services=&t=20210225162129"></script>');})();
```

