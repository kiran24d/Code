#
# Cookbook Name:: nginx
# Recipe:: vhosts
#
# Copyright 2018, Emerson Ecologics
#
# All rights reserved - Do Not Redistribute

vhosts = node['vhosts']

vhosts.each do |vhost|
  template vhost['path'] do
    source 'vhost.erb'
      variables({
        vhost: vhost
      })
  end

  directory "/etc/ssl/nginx/#{vhost['server_name']}" do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
    action :create
  end
  cookbook_file "#{vhost['public_crt']}" do
    source 'domain.crt'
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end
  cookbook_file "#{vhost['private_key']}" do
    source 'domain.key'
    owner 'root'
    group 'root'
    mode '0644'
    action :create
    notifies :restart, 'service[nginx]'
  end
end

service 'nginx' do
  action [ :enable, :restart ]
end
