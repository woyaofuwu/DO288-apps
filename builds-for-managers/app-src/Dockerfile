FROM jboss/base-jdk:8

# https://github.com/OpenShiftDemos/centos-jdk8-maven-docker/blob/master/Dockerfile

USER root

RUN yum -y install maven && yum -y clean all && mkdir -p /opt/app-root/bin 

# command line options to pass to the JVM &&  mvn install 
ENV	  JAVA_OPTIONS -Xmx512m        

# Copy the runnable fat JAR to the container.
ADD   target/builds-for-managers-swarm.jar /opt/app-root/bin/builds-for-managers.jar

COPY  run-app.sh /opt/app-root/bin/

RUN   chgrp -R 0 /opt/app-root && \
      chmod -R g=u /opt/app-root

EXPOSE 8080

USER  1001
# Run the fat JAR
CMD   /opt/app-root/bin/run-app.sh
