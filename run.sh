#!/bin/bash
# Copyright [2021] [Warwick New]
# SPDX-License-Identifier: Apache-2.0
service mariadb start
service apache2 start
exec tail -f /dev/null
