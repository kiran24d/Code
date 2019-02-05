#
# Cookbook:: efkl
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'java::oracle'
ver = '6.2.4'
url = "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-#{ver}"
jxms='1g'
jxmx='1g'

case node['platform_family']
  when 'debian'
    remote_file '/tmp/elasticsearch.deb' do
      source "#{url}.deb"
      show_progress true
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    execute 'install' do
      command 'apt install /tmp/elasticsearch.deb '
      action :run
    end
    bash 'configure' do
      code <<-EOH
        sysctl -w vm.max_map_count=262144
        sed -i 's/#cluster.name: my-application/cluster.name: MY-ES/g' /etc/elasticsearch/elasticsearch.yml
        sed -i 's/#node.name: node-1/node.name: ES-MASTER/g' /etc/elasticsearch/elasticsearch.yml
      EOH
      action :run
    end
    execute 'ES-ip config' do
      command "sed -i 's/#network.host: 192.168.0.1/network.host: #{node['ipaddress']}/g' /etc/elasticsearch/elasticsearch.yml ; sed -i 's/-Xms1g/-Xms#{jxms}/g' /etc/elasticsearch/jvm.options ; sed -i 's/-Xmx1g/-Xmx#{jxmx}/g' /etc/elasticsearch/jvm.options"
      action :run
    end
    service 'elasticsearch' do
      action [:start, :enable]
    end
    
    
  when 'fedora', 'rhel', 'amazon'
    remote_file '/tmp/elasticsearch.rpm' do
      source "#{url}.rpm"
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    execute 'install' do
      command 'yum install /tmp/elasticsearch.rpm'
      action :run
    end
    bash 'configure' do
        code <<-EOH
          sysctl -w vm.max_map_count=262144
          sed -i 's/#cluster.name: my-application/cluster.name: MY-ES/g' /etc/elasticsearch/elasticsearch.yml
          sed -i 's/#node.name: node-1/node.name: ES-MASTER/g' /etc/elasticsearch/elasticsearch.yml
        EOH
        action :run
    end
    execute 'ES-ip config' do
      command "sed -i 's/#network.host: 192.168.0.1/network.host: #{node['ipaddress']}/g' /etc/elasticsearch/elasticsearch.yml ; sed -i 's/-Xms1g/-Xms#{jxms}/g' /etc/elasticsearch/jvm.options ; sed -i 's/-Xmx1g/-Xmx#{jxmx}/g' /etc/elasticsearch/jvm.options"
      action :run
    end
    service 'elasticsearch' do
      action [:start, :enable]
    end
  end