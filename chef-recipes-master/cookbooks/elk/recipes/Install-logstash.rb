#
# Cookbook:: efkl
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'java::oracle'

ver = '6.2.4'
url = "https://artifacts.elastic.co/downloads/logstash/logstash-#{ver}"

case node['platform_family']
  when 'debian'
    remote_file '/tmp/logstash.deb' do
      source "#{url}.deb"
      show_progress true
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    execute 'install' do
      command 'apt install /tmp/logstash.deb '
      action :run
    end
    service 'logstash' do
      action [:start, :enable]
    end
    
  when 'fedora', 'rhel', 'amazon'
    remote_file '/tmp/logstash.rpm' do
      source "#{url}.rpm"
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    execute 'install' do
      command 'yum install /tmp/logstash.rpm'
      action :run
    end
    service 'logstash' do
        action [:start, :enable]
      end
  end