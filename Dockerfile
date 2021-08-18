FROM centos:centos7

RUN yum -y update; yum clean all
RUN yum -y install epel-release tar; yum clean all
RUN yum -y install nginx;

ADD index.html /usr/share/nginx/html/index.html

EXPOSE 80


