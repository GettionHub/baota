PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "
+----------------------------------------------------------------------
| 用于宝塔面板7.7版本的一键优化，因为脚本造成的问题请自行负责！
+----------------------------------------------------------------------
"

if [ $(whoami) != "root" ];then
    echo "请使用root权限执行命令！"
    exit 1;
fi
if [ ! -d /www/server/panel ] || [ ! -f /etc/init.d/bt ];then
    echo "未安装宝塔面板"
    exit 1
fi 

while [ "$go" != 'y' ] && [ "$go" != 'n' ]
do
    read -p "请确认你已经安装的版本是7.7，请确保仅用于学习使用！(y/n): " go;
done

if [ "$go" == 'n' ];then
    exit;
fi

if [ ! -f /www/server/panel/data/userInfo.json ]; then
    echo "{\"uid\":1000,\"username\":\"admin\",\"serverid\":1}" > /www/server/panel/data/userInfo.json
fi
echo "已去除宝塔面板强制绑定账号."

Layout_file="/www/server/panel/BTPanel/templates/default/layout.html";
JS_file="/www/server/panel/BTPanel/static/bt.js";
if [ `grep -c "<script src=\"/static/bt.js\"></script>" $Layout_file` -eq '0' ];then
    sed -i '/{% block scripts %} {% endblock %}/a <script src="/static/bt.js"></script>' $Layout_file;
fi;
cp -f /local/crack/src/bt.js $JS_file
echo "已去除各种计算题与延时等待."

sed -i "/htaccess = self.sitePath+'\/.htaccess'/, /public.ExecShell('chown -R www:www ' + htaccess)/d" /www/server/panel/class/panelSite.py
sed -i "/index = self.sitePath+'\/index.html'/, /public.ExecShell('chown -R www:www ' + index)/d" /www/server/panel/class/panelSite.py
sed -i "/doc404 = self.sitePath+'\/404.html'/, /public.ExecShell('chown -R www:www ' + doc404)/d" /www/server/panel/class/panelSite.py
echo "已去除创建网站自动创建的垃圾文件."

sed -i "s/root \/www\/server\/nginx\/html/return 400/" /www/server/panel/class/panelSite.py
if [ -f /www/server/panel/vhost/nginx/0.default.conf ]; then
    sed -i "s/root \/www\/server\/nginx\/html/return 400/" /www/server/panel/vhost/nginx/0.default.conf
fi
echo "已关闭未绑定域名提示页面."

sed -i "s/return render_template('autherr.html')/return abort(404)/" /www/server/panel/BTPanel/__init__.py
echo "已关闭安全入口登录提示页面."

sed -i "/p = threading.Thread(target=check_files_panel)/, /p.start()/d" /www/server/panel/task.py
sed -i "/p = threading.Thread(target=check_panel_msg)/, /p.start()/d" /www/server/panel/task.py
echo "已去除消息推送与文件校验."

sed -i "/^logs_analysis()/d" /www/server/panel/script/site_task.py
sed -i "s/run_thread(cloud_check_domain,(domain,))/return/" /www/server/panel/class/public.py
echo "已去除面板日志与绑定域名上报."

if [ ! -f /www/server/panel/data/not_recommend.pl ]; then
    echo "True" > /www/server/panel/data/not_recommend.pl
fi
if [ ! -f /www/server/panel/data/not_workorder.pl ]; then
    echo "True" > /www/server/panel/data/not_workorder.pl
fi
echo "已关闭活动推荐与在线客服."

if [ -f /www/server/panel/BTPanel/templates/default/soft.html ];then
    chattr -i /www/server/panel/BTPanel/templates/default/soft.html
    rm -rf /www/server/panel/BTPanel/templates/default/soft.html
    cp -f /local/crack/src/soft.html /www/server/panel/BTPanel/templates/default/soft.html
    chattr +i /www/server/panel/BTPanel/templates/default/soft.html
else
    cp -f /local/crack/src/soft.html /www/server/panel/BTPanel/templates/default/soft.html
fi
echo "已去除商城界面广告."

if [ -f /www/server/panel/data/plugin.json ];then
    chattr -i /www/server/panel/data/plugin.json
    rm /www/server/panel/data/plugin.json
    cp -f /local/crack/src/plugin.json /www/server/panel/data/plugin.json
    chattr +i /www/server/panel/data/plugin.json
else
    cp -f /local/crack/src/plugin.json /www/server/panel/data/plugin.json
    chattr +i /www/server/panel/data/plugin.json
fi
echo "已去除插件安装限制."

if [ -f /www/server/panel/BTPanel/templates/default/index.html ];then
    rm /www/server/panel/BTPanel/templates/default/index.html
    cp -f /local/crack/src/index.html /www/server/panel/BTPanel/templates/default/index.html
else
    cp -f /local/crack/src/index.html /www/server/panel/BTPanel/templates/default/index.html
fi
echo -e "已去除首页升级红点."

if [ -f /www/server/panel/task.py ];then
    chattr -i /www/server/panel/task.py
    rm /www/server/panel/task.py
    cp -f /local/crack/src/task.py /www/server/panel/task.py
    chattr +i /www/server/panel/task.py
else
    cp -f /local/crack/src/task.py /www/server/panel/task.py
    chattr +i /www/server/panel/task.py
fi
echo -e "修复0点CPU高占用BUG完成."

if [ -f /www/server/panel/data/repair.json ];then
    chattr -i /www/server/panel/data/repair.json
    rm /www/server/panel/data/repair.json
    cp -f /local/crack/src/repair.json /www/server/panel/data/repair.json
    chattr +i /www/server/panel/data/repair.json
else
    cp -f /local/crack/src/repair.json /www/server/panel/data/repair.json
    chattr +i /www/server/panel/data/repair.json
fi
echo -e "文件防止修改完成."

/etc/init.d/bt restart

echo -e "=================================================================="
echo -e "\033[32m宝塔面板优化执行完毕\033[0m"
echo -e "=================================================================="
echo  "如需还原之前的样子，请在面板首页点击“修复”"
echo -e "=================================================================="