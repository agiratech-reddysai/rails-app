#
# Cookbook Name:: build-defaults
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node['platform']
when "centos"
    execute 'wget-tar' do
      command 'yum install wget -y && yum install tar -y'
    end

    execute 'psmisc' do
      command 'yum install psmisc -y'
    end

    execute 'groupinstall' do
      command "yum groupinstall 'Development Tools' -y"
    end

    execute 'epel-release' do
      command 'yum install epel-release yum-utils -y'
    end

    execute 'enable-epel' do
      command 'yum-config-manager --enable epel'
    end

    execute 'clean-all' do
      command 'yum clean all && yum update -y'
    end

    execute 'zlib-devel' do
      command 'yum install zlib-devel -y'
    end

    execute 'openssl-static' do
      command 'yum install openssl-static -y'
    end

    execute 'pygpgme' do
      command 'yum install -y pygpgme'
    end

    execute 'curl' do
      command 'yum install curl -y'
    end

    execute 'update' do
      command 'yum update -y'
    end

    execute 'add out e17 yum repo' do
      command 'curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo'
    end
when "ubuntu"
    execute 'wget-tar' do
      command 'apt-get install wget -y && apt-get install tar -y'
    end

    execute 'psmisc' do
      command 'apt-get install psmisc -y'
    end

    execute 'dirmngr-gnupg' do
      command 'apt-get install -y dirmngr gnupg'
    end

    execute 'zlib1g-dev' do
      command 'apt-get install zlib1g-dev -y'
    end

    execute 'libssl-dev' do
      command 'apt-get install libssl-dev -y'
    end

    execute 'update' do
      command 'apt-get update -y'
    end
end



