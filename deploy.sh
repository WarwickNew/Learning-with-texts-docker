#!/bin/bash
# Copyright [2023] [Warwick New]
# SPDX-License-Identifier: Apache-2.0
exec docker run -d --name=learning-with-texts -p 80:80 $(whoami)/learning-with-texts
