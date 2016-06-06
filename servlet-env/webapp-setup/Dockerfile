# Download Maven dependencies to a deployment volume

FROM ubuntu:16.04
MAINTAINER Douglas Groves <douglas.groves.dev@gmail.com>
RUN apt-get update \
	&& apt-get -y install \
		openjdk-8-jdk \
		maven
VOLUME ["/var/lib/tomcat8/webapps"]
CMD mvn dependency:copy -Dartifact=org.apache.axis2:axis2-webapp:1.7.2:war -DoutputDirectory=/var/lib/tomcat8/webapps -Dmdep.stripVersion=true