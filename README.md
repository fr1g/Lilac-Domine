# Lilac-Domine
可用的实例项目，用于武软JavaEE(SSM)课程设计

仓库中不附带说明书，请自己想办法。

如果要将本项目再次作为课程设计提交，请*自己找出所有包含原作者的信息的项目并删除。* **注意，根据本项目的License（MIT），这个行为如若公开和或售卖即为侵权。请好自为之。**
<br>本项目的实际贡献者：<a href="https://github.com/fr1g">Feiron Iguista</a> | <a href="https://github.com/GabrielxDuO">Gabriel Tenma</a><br>
原仓库Commits：<a href="https://gio.kami.su/lilac-work/">https://gio.kami.su/lilac-work/</a>

// 原仓库（现已转为private）的readme：

# Lilac
- JavaEE & JavaWeb2 Final Work.
- 来点新瓶装旧酒: 域名购买系统!<br>
《所学技术》: 指本课所学 笑死 搞这不严谨的到后来来搞口头解释......
我还巴不得用blazor写嘞。
<br>本仓库仅为**带有**SSM框架的 JavaEE版本。<br>

//结束。你当然可以悄悄找地方合理地咒骂蠢笨的企鹅。但是倘若你的老师是武软难得的雨燕，那么祝历史的河流将你淹没。

<hr/>

项目运行说明.txt: (Markdownized.)

Lilac.DoMine 域名交易系统是用于有限的域名交易的管理系统...

JDK: 1.8.*
Tomcat: 9.0.*
数据库: MySQL 8.0.* 
开发环境：
	操作系统：macOS Ventura，
	架构: ARM，
	IDE：IDEA Ultimate 2021[f]/2022[g]

// 从这里开始，以下内容不作为作业的“项目运行说明”出现。
无需在这里写下开发环境的数据库密码。因为在教师方面有检查需求时候，将会直接导入SQL存档，而非复现开发环境的数据库环境。
=> 如何导入：在完全克隆或下载仓库包或ZIP存档情况下/

 - Windows：
	使用“命令提示符”打开一个MySQL连接
	创建一个数据库，名为 `lilac`
	使用该数据库
	键入命令“source <path>”，在<path>替换为lilac_test_env.sql在你计算机上的实际位置
	执行。

 - macOS和部分Linux发行版(GUI)*
	*它必须有图形界面，并且有受GNU/KDE // Xfce // ...其它桌面环境的支持
	使用“终端”打开一个MySQL连接
	创建一个数据库，名为 `lilac`
	使用该数据库
	键入命令“source”，在其后确保有一个空格
	找到lilac_test_env.sql在你计算机上所在的位置，将其拖入刚才的终端窗口
	！如果     命令末尾出现了路径：
		执行。
	！否则：
		手动在刚才的空格后面键入lilac_test_env.sql在你计算机上的实际位置
		执行。

 - 没有GUI的其他情况：
	请参照由Apache和Oracle提供的指南，将本项目编译为WAR包并且部署到您当前环境的Tomcat服务器上。然后使用其他设备尝试访问。如若没有相关指南，则代表不支持。
