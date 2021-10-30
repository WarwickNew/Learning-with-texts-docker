# Copyright [2021] [Warwick New]
# SPDX-License-Identifier: Apache-2.0
FROM debian:stable

# Update and install system packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install unzip -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2 libapache2-mod-php php php-mbstring php-mysql default-mysql-server default-mysql-client -y

# Configure mysql
RUN service mariadb start && sleep 5 && mysqladmin -u root password 'abcxyz' && sleep 5 && service mariadb stop

# Configure LWT
RUN rm /var/www/html/index.html
WORKDIR /var/www/html/lwt
COPY lwt_v_2_0_2.zip .
RUN unzip lwt_v_2_0_2.zip && rm lwt_v_2_0_2.zip

RUN ls
RUN mv connect_xampp.inc.php connect.inc.php
RUN sed -i 's/$passwd = "";/$passwd = "abcxyz";/g' connect.inc.php

RUN chmod -R 755 /var/www/html/lwt

# Clean up
RUN DEBIAN_FRONTEND=noninteractive apt-get purge --autoremove unzip -y

WORKDIR /root
COPY run.sh .
CMD ["./run.sh"]
