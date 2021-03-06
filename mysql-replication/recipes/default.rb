#
# Cookbook Name:: mysql-replication
# Recipe:: default
#
# Copyright 2015 Pavel Yudin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'yum-mysql-community::mysql57'
# Configure the MySQL client.
mysql_client 'default' do
  version '5.7'
  action :create
end

# Configure the MySQL service
mysql_service 'default' do
  version '5.7'
  bind_address '0.0.0.0'
  port '3306'
  initial_root_password 'root'
  action [:create, :start]
end