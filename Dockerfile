FROM tomcat:9.0-jre8
MAINTAINER Guilherme Barros <guilherme@tecsoft.info>
RUN echo "deb http://http.debian.net/debian jessie contrib" >> /etc/apt/sources.list && \
    apt-get update && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get install -y ttf-mscorefonts-installer && \
    apt-get clean
ENV JAVA_OPTS="-Djava.awt.headless=true" \
    CATALINA_OPTS="-XX:+UseBiasedLocking -XX:BiasedLockingStartupDelay=0 -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+DisableExplicitGC -XX:+CMSIncrementalMode -XX:+CMSIncrementalPacing -XX:+CMSParallelRemarkEnabled -XX:+UseCompressedOops -XX:+UseCMSInitiatingOccupancyOnly -Djava.awt.headless=true -Duser.timezone=America/Recife -Duser.language=pt -Duser.region=BR"