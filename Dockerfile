FROM debian:buster
MAINTAINER Cesar Jaimes <cjaimes2student.42.fr>
COPY ./srcs/var/www/localhost/index.html ./
COPY ./srcs/wordpress-5.3.tar.gz ./
COPY ./srcs/localhost-conf ./
COPY ./srcs/boot.sh ./
COPY ./srcs/run.sh ./
# cmd sh boot.sh