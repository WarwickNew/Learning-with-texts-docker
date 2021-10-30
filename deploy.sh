#!/bin/bash
# Copyright [2021] [Warwick New]
# SPDX-License-Identifier: Apache-2.0
exec docker run -d --name=learning-with-texts -p 80:80 --mount source=lwt-database,destination=/var/lib/mysql warwick/learning-with-texts
