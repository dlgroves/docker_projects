FROM ubuntu:16.04
MAINTAINER Douglas Groves <douglas.groves.dev@gmail.com>
RUN apt-get clean \
	&& apt-get update \
	&& apt-get install -y openjdk-8-jdk wget curl \
	&& groupadd -r derby \
	&& useradd -s /usr/sbin/nologin -g derby -d /home/derby derby \
	&& wget http://mirror.ox.ac.uk/sites/rsync.apache.org/db/derby/db-derby-10.12.1.1/db-derby-10.12.1.1-bin.tar.gz -P /opt/db \
	&& test "$(curl -s http://www.apache.org/dist/db/derby/db-derby-10.12.1.1/db-derby-10.12.1.1-bin.tar.gz.md5)" = "$(md5sum /opt/db/*.tar.gz | cut -d" " -f 1)" \ 
	&& tar -xvzf /opt/db/db-derby-10.12.1.1-bin.tar.gz -C /opt/db \
	&& chown -R derby:derby /opt/db
ADD flights.sql /opt/db/scripts/flights.sql
USER derby
ENV DERBY_OPTS=-Dderby.system.home=/opt/db/database
CMD /opt/db/db-derby-10.12.1.1-bin/bin/ij /opt/db/scripts/flights.sql \
	&& java -jar /opt/db/db-derby-10.12.1.1-bin/lib/derbyrun.jar server start
EXPOSE 1527
