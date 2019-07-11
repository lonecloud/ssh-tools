# ssh-tools

![](https://img.shields.io/badge/lanauage-%E4%B8%AD%E6%96%87-brightgreen.svg)[![](https://img.shields.io/badge/platform-linux/MacOS-brightgreen.svg)]()[![release](https://img.shields.io/badge/release-v0.1-orange.svg)](<https://github.com/lonecloud/ssh-tools/releases>)[![License](https://img.shields.io/badge/license-Apache%202-4EB1BA.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)

> 一款为方便mac以及类unix使用ssh以及ssh跳板机的一个shell小工具

使用说明：

1. 克隆或者下载该项目

```bash
git clone git@github.com:lonecloud/ssh-tools.git
```

2. 配置ssh.dat

说明一下这几个的参数

1. 机器类型范围值：0 直接连接机器，1. 跳板机  2.目标机
2. ssh中的用户名以及IP(设置端口，非必填)： eg:username@ip [:port]
3. 密码
4. 备注，非必填选项

```bash
0 root@192.168.209.10:2315 123456 这个是直连机器
1 root@192.168.209.11 123456 这个是跳板机器
2 root@192.168.209.12:223 123456 这个是通过跳板后的目标机器
0 root@192.168.209.13 123456
```

操作指引图片：(PS: 最近不翻墙图片还看不了？！)

直连：

![直连操作](images/1541678825141.gif)
![直连操作](https://pic.0x4096.com/1541678825141.gif)

跳板机：

![跳板机](images/1541679098732.gif)
![跳板机](https://pic.0x4096.com/1541679098732.gif)

iterm2配置：

⌘ + o 打开配置文件

![iterm2](https://pic.0x4096.com/Xnip2019-07-12_00-47-14.jpg)

设置好相应的信息即可

![iterm2](https://pic.0x4096.com/Xnip2019-07-12_00-53-08.jpg)

双击配置文件即可打开！

![iterm2](https://pic.0x4096.com/Xnip2019-07-12_00-55-00.jpg)




## 未待完续，欢迎Fork and star

github地址：https://github.com/lonecloud/ssh-tools

码云地址：https://gitee.com/lonecloud/ssh-tools



欢迎大家提出宝贵的意见以及建议，请大家在issue提出哈