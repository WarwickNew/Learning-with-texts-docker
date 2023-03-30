#!/bin/bash
# Copyright [2023] [Warwick New]
# SPDX-License-Identifier: Apache-2.0

# Fix permissions that mounting a mysql database as a volume broke
# Not a great fix I know, but I'm lazy feel free to make a merge request to fix.
chown mysql:mysql /var/lib/mysql

service mariadb start
#systemctl start mariadb

service apache2 start
#systemctl start apache2
exec tail -f /dev/null
