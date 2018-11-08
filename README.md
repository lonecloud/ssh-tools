# ssh-tools

> 一款为方便mac以及类unix使用ssh以及ssh跳板机的一个shell小工具

使用说明：

1. 克隆或者下载该项目

```bash
git clone xxx
```

2. 配置ssh.dat

说明一下这几个的参数

1. 机器类型范围值：0 直接连接机器，1. 跳板机  2.目标机
2. ssh中的用户名以及IP： eg:username@ip
3. 密码

```bash
0 root@192.168.209.10 123456
1 root@192.168.209.11 123456
2 root@192.168.209.12 123456
0 root@192.168.209.13 123456
```

操作指引图片：

直连：

![直连操作](images/1541678825141.gif)

跳板机：

![跳板机](images/1541679098732.gif)

iterm2配置：



## 未待完续，欢迎Fork and star

github地址：https://github.com/lonecloud/ssh-tools

码云地址：https://gitee.com/lonecloud/ssh-tools



欢迎大家提出宝贵的意见以及建议，请大家在issue提出哈