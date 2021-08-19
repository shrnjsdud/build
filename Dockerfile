FROM centos:centos7

RUN yum -y update 
RUN yum -y install epel-release
RUN yum -y install nginx

ADD index.html /usr/share/nginx/html/index.html

EXPOSE 80


