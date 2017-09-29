FROM openshift/base-centos7:latest
RUN yum update -y; yum install wget -y; yum clean all
RUN yum install java-1.8.0-openjdk.x86_64 -y
RUN rpm -Uvh http://repo.rundeck.org/latest.rpm
RUN yum install rundeck -y
CMD service rundeck start
EXPOSE 4440
