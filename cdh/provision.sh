#!/bin/bash
# Copyright (c) 2015 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

chmod 600 ~/.ssh/id_rsa
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo sed -i -e 's@^mirrorlist@#mirrorlist@' /etc/yum.repos.d/epel*.repo
sudo sed -i -e 's@^#baseurl.*/epel@baseurl=http://dl.fedoraproject.org/pub/epel@' /etc/yum.repos.d/epel*.repo
sudo yum clean all
sudo yum install git ansible1.9*.el6 screen tmux python-jinja2 -y
