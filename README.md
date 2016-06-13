# HigherEducationOASystem
##高校教学办公管理系统
​	使用jFinal框架开发
## 运行环境
>Mysql  5.7
>Tomcat 7.0.68
>Jdk1.8
## 所需文件
>建表.sql
>教学任务书_格式模板.xlsx
>教学任务书_示例数据.xlsx
## 运行步骤
1. 启动Mysql
2. 初始化数据库，执行建表.sql文件，创建表和基础数据
3. 配置数据库连接信息，在源码包，res目录下的database_config.txt中配置即可，重新编译生成war包
4. 将生成的HigherEducationOASystem_war archive.war文件放到Tomcat的webapps目录下
5. 部署和启动Tomcat，/bin/startup.bat
6. 打开浏览器，地址栏输入127.0.0.1:8080/index 系统默认账号Admin,密码123456，该用户身份是系主任，登录即可进入系统主页。
7. 导入任务书，使用提供的教学任务书_格式模板.xlsx填写数据，或者直接使用提供的示例数据文件，即可成功导入。