#jdk 1.7
FROM ubuntu
MAINTAINER wangzhennan
WORKDIR /export/local
RUN mkdir -p /export/zookeeper/data /export/zookeeper/logs
ADD ["jdk1.7.0_60.tar.gz","."]
ADD ["zookeeper-3.4.10.tar.gz","."]
COPY ["zoo.cfg","./zookeeper-3.4.10/conf"]
COPY ["myid","/export/zookeeper/data/"]
ENV JAVA_HOME=/export/local/jdk1.7.0_60
ENV PATH=${JAVA_HOME}/bin:$PATH
ENTRYPOINT ["/export/local/zookeeper-3.4.10/bin/zkServer.sh","start-foreground"]
