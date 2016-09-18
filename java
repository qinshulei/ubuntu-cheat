# switch jdk version, you need add $JAVA_HOME first
alias jdk6='export JAVA_HOME=$JAVA_6_HOME ; export PATH=$JAVA_6_HOME/bin:$PATH'
alias jdk7='export JAVA_HOME=$JAVA_7_HOME ; export PATH=$JAVA_7_HOME/bin:$PATH'

# install java 8
wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u71-b15/jdk-8u71-linux-x64.tar.gz
sudo mkdir /opt/jdk
sudo tar -zxf jdk-8u71-linux-x64.tar.gz -C /opt/jdk/
rm jdk-8u71-linux-x64.tar.gz

sudo update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_71/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_71/bin/javac 1

# 选择java版本
sudo update-alternatives --config java
sudo update-alternatives --config javac

java -version
javac -version