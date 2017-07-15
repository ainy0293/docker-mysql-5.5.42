FROM ubuntu:14.04
MAINTAINER Ainy Min email: ainy@ifool.me website: http://ifool.me
ENV REFRESHED_AT 2017-05-09
ENV PATH $PATH:/usr/local/mysql/bin
ADD localtime /etc/localtime
ADD timezone /etc/timezone
ADD mysql_install.sh /root
ADD sources.list.trusty /etc/apt/sources.list
#COPY boost_1_59_0.tar.gz /root
#COPY mysql-5.7.17.tar.gz /root
WORKDIR /root
RUN ./mysql_install.sh
ADD mysql.startup.sh /usr/share/
RUN chmod +x /usr/share/mysql.startup.sh
#RUN /etc/init.d/mysql start \
#	&& mysql -uroot -e "grant all privileges on *.* to 'root'@'%' identified by '123456';" \
#	&& mysql -uroot -e "grant all privileges on *.* to 'root'@'localhost' identified by '123456';" \
#	&& /etc/init.d/mysql stop \
#	&& rm -rf /tmp/mysql.sock.lock
VOLUME ["/usr/local/mysql/data"]
EXPOSE 3306
CMD ["/usr/share/mysql.startup.sh"]

