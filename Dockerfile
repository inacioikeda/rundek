FROM openshift/base-centos7:latest
RUN yum update -y; yum install wget -y; yum clean all
RUN yum install java-1.8.0-openjdk.x86_64 -y
RUN wget -o http://download.rundeck.org/rpm/rundeck-2.9.3-1.37.GA.noarch.rpm
RUN rpm -Uvh rundeck-2.9.3-1.37.GA.noarch.rpm
CMD service rundek start
EXPOSE 4440
