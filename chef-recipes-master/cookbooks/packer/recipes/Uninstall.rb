#
# Cookbook:: packer
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'chocolatey::default'

case node['platform_family']
  when 'debian', 'fedora', 'rhel', 'amazon'
    execute 'Uninstall' do
      command 'rm -f /usr/bin/packer'
      action :run
    end
  when 'windows'
    chocolatey_package 'packer' do
      action :purge
    end  
end
