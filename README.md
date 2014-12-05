# ubuntu-cheat
本项目用来记录我自定义的`cheat`

## cheat
`cheat`就是一个命令，一般用来显示一个命令的常用方法。毕竟看`man`有时候太麻烦。

以下为`cheat`的项目地址： [https://github.com/chrisallenlane/cheat](https://github.com/chrisallenlane/cheat)

### `cheat`的安装

```bash
# install python and pip

# 安装 Python 发布版本，dev包必须安装，很多用pip安装包都需要编译
sudo apt-get install python2.7 python2.7-dev python3.2 python3.2-dev
# 很多pip安装的包都需要libssl和libevent编译环境
sudo apt-get install build-essential libssl-dev libevent-dev libjpeg-dev libxml2-dev libxslt-dev
# 安装 pip
sudo apt-get install python-pip

# First install the required python dependencies with:
sudo pip install docopt pygments

# Then, clone this repository, cd into it, and run:
cd ~
git clone https://github.com/chrisallenlane/cheat.git cheat
cd cheat
sudo python setup.py install

```

## ubuntu-cheat 安装
本项目  ubuntu-cheat 其实可以理解为我的`cheat`命令的配置文件。因此 clone 到 `${HOME}/.cheat`目录下即可。

```bash
git clone https://coding.net/qinshulei/ubuntu-cheat.git ~/.cheat
```

## ubuntu-cheat 的内容
+ 会慢慢收集，自己工作中会用到，但容易遗忘的命令或知识点。
+ 尽量记录一些足够通用的命令
+ cheat 分两种：一种是命令，全小写命名。一种是知识点，以驼峰式命名。
+ 每个命令的cheat，尽量不超过终端全屏下的一个屏幕。知识点的cheat原则上不限长度，但每个主题都尽量间断，方便ack或者grep查找。
+ 欢迎大家的补充
