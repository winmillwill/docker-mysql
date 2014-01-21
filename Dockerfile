FROM ubuntu:precise

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update -q && apt-get -y install mysql-client mysql-server
ADD my.cnf /etc/mysql/my.cnf
ADD ./startup.sh /opt/startup.sh
EXPOSE 3306
ENTRYPOINT ["/bin/bash", "/opt/startup.sh"]
CMD [""]
