

case node[:platform]
when 'centos'
  execute 'add out e17 yum repo' do
    command 'curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo'
  end
  package 'Install nginx' do
    package_name 'nginx'
    package_name 'passenger'
  end
when 'ubuntu'
  include_recipe 'apt'
  package 'apt-transport-https'

  apt_uri = node.nginx_passenger.use_passenger_4 ? "https://oss-binaries.phusionpassenger.com/apt/passenger/4" : "https://oss-binaries.phusionpassenger.com/apt/passenger"

  apt_repository "phusion" do
    action        :add
    uri           apt_uri
    distribution  node.lsb.codename
    components    ['main']
    keyserver     "hkp://keyserver.ubuntu.com:80"
    key           "561F9B9CAC40B2F7"
  end

  package "nginx-common" do
    options '-o DPkg::Options::="--force-confold"'
  end
  package 'Install nginx' do
    package_name 'passenger'
    package_name 'nginx-extras'
  end
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action   :enable
end

bash 'current_path' do
  code <<-EOH
    mkdir -p #{node['nginx']['current_path']}
  EOH
end

include_recipe 'nginx::commons'

template "#{node['nginx']['dir']}/conf.d/passenger.conf" do
  source 'modules/passenger1.conf.erb'
  owner  'root'
  group  node['root_group']
  mode   '0644'
  notifies :reload, 'service[nginx]', :delayed
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action   :start
end