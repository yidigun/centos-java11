FROM centos:latest
MAINTAINER dklee@yidigun.com

ENV JAVA_VERSION_MAJOR 11
ENV JAVA_VERSION_MINOR 0
ENV JAVA_VERSION_BUILD 0

RUN yum -y install libX11 libXext libXi libXrender libXtst alsa-lib freetype && \
    mkdir /opt/oracle && \
    curl -jksSL https://download.java.net/java/early_access/jdk11/25/BCL/jdk-11-ea+25_linux-x64_bin.tar.gz | \
        tar zxf - -C /opt/oracle && \
    ln -s jdk-${JAVA_VERSION_MAJOR} /opt/oracle/java

ENV JAVA_HOME /opt/oracle/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
