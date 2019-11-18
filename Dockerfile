FROM debian:buster
MAINTAINER Cesar Jaimes <cjaimes2student.42.fr>
COPY ./srcs/config.inc.php ./
COPY ./srcs/index.html ./
COPY ./srcs/wordpress.tar.gz ./
COPY ./srcs/wordpress.sql ./
COPY ./srcs/localhost-conf ./
COPY ./srcs/boot.sh ./
COPY ./srcs/run.sh ./
# cmd sh boot.sh