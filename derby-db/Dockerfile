# Provision a container running a Derby database

FROM ubuntu:16.04
MAINTAINER Douglas Groves <douglas.groves.dev@gmail.com>
ADD flights.sql /opt/db/scripts/flights.sql
RUN apt-get clean \
	&& apt-get update \
	&& apt-get install -y \
		openjdk-8-jdk \
		wget \
		curl \
	&& groupadd -r derby \
	&& useradd -s /usr/sbin/nologin -g derby -d /home/derby derby \
	&& wget http://mirror.ox.ac.uk/sites/rsync.apache.org/db/derby/db-derby-10.12.1.1/db-derby-10.12.1.1-bin.tar.gz -P /opt/db \
	&& test "$(curl -s http://www.apache.org/dist/db/derby/db-derby-10.12.1.1/db-derby-10.12.1.1-bin.tar.gz.md5)" = "$(md5sum /opt/db/*.tar.gz | cut -d" " -f 1)" \ 
	&& tar -xvzf /opt/db/db-derby-10.12.1.1-bin.tar.gz -C /opt/db \
	&& mkdir -p /opt/db/database/ \
	&& echo "derby.system.home=/opt/db/database" > /opt/db/database/derby.properties \
	&& /opt/db/db-derby-10.12.1.1-bin/bin/ij -p /opt/db/database/derby.properties /opt/db/scripts/flights.sql \
	&& chown -R derby:derby /opt/db
USER derby
ENV DERBY_OPTS "-Dderby.system.home=/opt/db/database"
CMD /opt/db/db-derby-10.12.1.1-bin/bin/startNetworkServer -h 0.0.0.0
EXPOSE 1527
