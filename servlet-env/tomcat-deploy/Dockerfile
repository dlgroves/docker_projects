# Provision a Tomcat servlet container

FROM ubuntu:16.04
MAINTAINER Douglas Groves <douglas.groves.dev@gmail.com>
RUN apt-get update \
	&& apt-get -y install \
		openjdk-8-jdk \
		tomcat8
CMD chown -R tomcat8:tomcat8 /var/lib/tomcat8/webapps \
	&& echo "Starting Tomcat..." \
	&& service tomcat8 start > /dev/null 2>&1 || true \
	&& tail -f /var/log/tomcat8/catalina.out
EXPOSE 8080