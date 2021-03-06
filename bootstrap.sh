#!/bin/sh

# install utilities
yum -y install wget curl which tzdata man alternatives

# download and install gosu
arch=amd64
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch"
curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch.asc"
gpg --verify /usr/local/bin/gosu.asc
rm /usr/local/bin/gosu.asc
chmod +x /usr/local/bin/gosu

# download and install oracle jdk
cd /opt
wget --quiet --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm -O jdk-8-linux-x64.rpm
yum install -y jdk-8-linux-x64.rpm
rm -f jdk-8-linux-x64.rpm

# clean up
yum clean all
rm -rf /var/cache/yum
