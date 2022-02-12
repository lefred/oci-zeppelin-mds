#!/bin/bash
#set -x

cd /opt
wget https://dlcdn.apache.org/zeppelin/zeppelin-0.10.0/zeppelin-0.10.0-bin-all.tgz
tar zxvf zeppelin-0.10.0-bin-all.tgz
rm -f zeppelin-0.10.0-bin-all.tgz
mv zeppelin-0.10.0-bin-all zeppelin
cd zeppelin
cp conf/zeppelin-site.xml.template conf/zeppelin-site.xml

sed -i 's/127.0.0.1/0.0.0.0/' conf/zeppelin-site.xml
sed -i 's/8080/80/' conf/zeppelin-site.xml
sed -i 's/8443/443/' conf/zeppelin-site.xml

dnf install -y mysql-connector-java mysql-connector-python3
mkdir interpreter/mysql
cp /usr/share/java/mysql-connector-java.jar interpreter/mysql

./bin/zeppelin-systemd-service.sh enable
mv /etc/systemd/system/zeppelin.systemd /etc/systemd/system/zeppelin.service
/usr/bin/systemctl daemon-reload

systemctl start zeppelin

echo "Zepping installed and started !"
