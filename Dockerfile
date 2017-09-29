
FROM openshift/base-centos7:latest
MAINTAINER inacio.ikeda@gmail.com

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN echo "root:root" | chpasswd
RUN adduser rundeck
RUN adduser developer
RUN adduser admin

RUN yum update -y; yum install wget -y; yum clean all; rm -rf /var/cache/yum
RUN yum install java-1.8.0-openjdk.x86_64 -y
RUN rpm -Uvh http://repo.rundeck.org/latest.rpm
RUN yum install rundeck -y
VOLUME /root/rundek /etc/rundeck
RUN chmod 777 -R /etc/rundeck
ENTRYPOINT /usr/sbin/init
CMD systemctl start rundeck && systemctl enable rundeck
EXPOSE 4440
USER rundeck
