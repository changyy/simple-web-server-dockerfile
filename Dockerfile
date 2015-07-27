FROM ubuntu:14.04

RUN apt-get update --fix-missing
#RUN apt-get -y upgrade
#RUN apt-get -y dist-upgrade
#RUN apt-get -y autoremove

# password
RUN echo 'root:admin' | chpasswd

# tools
RUN apt-get -y install telnet vim curl wget 

# php language
RUN apt-get -y install php5 php5-mcrypt php5-mysql

# service
RUN apt-get -y install openssh-server apache2 libapache2-mod-php5

# apache setup: AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using x.x.x.x. Set the 'ServerName' directive globally to suppress this message
RUN echo "ServerName localhost" > /etc/apache2/conf-available/ServerName.conf
RUN a2enconf ServerName

EXPOSE 80 22
#VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
#ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
