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
    execute 'update' do
      command 'yum update -y'
    end

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

    execute 'enable epel' do
      command 'yum-config-manager --enable epel'
    end

    execute '' do
      command 'yum clean all && yum update -y'
    end

    execute 'pygpgme curl' do
      command 'yum install -y pygpgme curl'
    end
when "ubuntu"
    execute 'update' do
      command 'apt-get update -y'
    end

    execute 'wget-tar' do
      command 'apt-get install wget -y && apt-get install tar -y'
    end

    execute 'psmisc' do
      command 'apt-get install psmisc -y'
    end

    execute 'dirmngr gnupg' do
      command 'apt-get install -y dirmngr gnupg'
    end
end



