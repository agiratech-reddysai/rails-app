

case node[:platform]
when 'centos'
  package 'nginx'
  package 'passenger'
when 'ubuntu'
  include_recipe 'apt::default'
  package 'apt-transport-https'

  apt_repository 'phusionpassenger' do
    uri 'https://oss-binaries.phusionpassenger.com/apt/passenger'
    distribution node['lsb']['codename']
    components %w(main)
    deb_src true
    keyserver 'keyserver.ubuntu.com'
    key '561F9B9CAC40B2F7'
  end

  package "nginx-common" do
    options '-o DPkg::Options::="--force-confold"'
  end
  package 'nginx-extras' do
    version '1.12.1'
  end
  package 'passenger'
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