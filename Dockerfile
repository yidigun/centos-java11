FROM centos:latest
MAINTAINER dklee@yidigun.com

ENV JAVA_VERSION_MAJOR 11
ENV JAVA_VERSION_MINOR ea
ENV JAVA_VERSION_BUILD 25

RUN yum -y install libX11 libXext libXi libXrender libXtst alsa-lib freetype && \
    mkdir /opt/oracle && \
    curl -jksSL https://download.java.net/java/early_access/jdk${JAVA_VERSION_MAJOR}/${JAVA_VERSION_BUILD}/BCL/jdk-${JAVA_VERSION_MAJOR}-ea+${JAVA_VERSION_BUILD}_linux-x64_bin.tar.gz | \
        tar zxf - -C /opt/oracle && \
    ln -s jdk-${JAVA_VERSION_MAJOR} /opt/oracle/java && \
    yum -y clean all && \
    rm -rf /var/cache/yum

ENV JAVA_HOME /opt/oracle/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
