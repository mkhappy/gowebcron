# 定时任务管理系统
#### 基于golang beego

主要特点：
----
- 1、支持本地定时任务、跨服务器管理（密码或者密钥两种方式）
- 2、支持秒级定时任务(核心组件https://github.com/robfig/cron.git)
- 3、支持复制任务，快速添加任务，支持批量启动和停止任务
- 4、定时任务日志详细（任务运行用时，执行结果等），方便任务排错
- 5、资源占用小，支持大并发
- 6、支持任务分组，常用小功能多，更方便管理定时任务
- 7、跨平台，易部署
- 8、执行结果邮件发送

安装方法    
----
- 1、go get github.com/mkhappy/gowebcron
- 2、创建mysql数据库，导入install.sql。例如：cat install | mysql -u xxx -p xxx -h host -D databasename
- 3、修改conf/app.conf 配置数据库，配置邮件服务器（用以发送），以及其他配置。
- 4、运行 go build 编译。
- 5、运行 ./run.sh start|stop  (部分linux需要安装killall功能 yum install psmisc 或 apt-get install psmisc)

参考
----
- https://github.com/robfig/cron.git

Update log
----
v1.0.0 增加邮件通知功能，修改页面bug
