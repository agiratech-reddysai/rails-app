#
# Cookbook Name:: ruby-install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'install_ruby' do
  code <<-EOH
    cd /opt
    wget http://ftp.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz
    tar -xzvf ruby-2.4.1.tar.gz
    rm ruby-2.4.1.tar.gz
    cd ruby-2.4.1/
    ./configure
    make
    sudo make install
  EOH
end

bash 'bundler_install' do
  code <<-EOH
    gem install bundler
  EOH
end