FROM openshift/base-centos7:latest
RUN yum update -y; yum install wget -y; yum clean all
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm && rpm -Uvh jdk-8u131-linux-x64.rpm
RUN wget -o http://download.rundeck.org/rpm/rundeck-2.9.3-1.37.GA.noarch.rpm && rpm -Uvh rundeck-2.9.3-1.37.GA.noarch.rpm
CMD service rundek start
EXPOSE 4440
