#
# Cookbook:: chrome
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform_family']
  when 'debian', 'fedora', 'rhel', 'amazon'
    bash 'Uninstall' do
      code <<-EOH
      rm -fr /usr/local/share/chromedriver
      rm -f /usr/local/bin/chromedriver
      rm -f /usr/bin/chromedriver
      EOH
      action :run
    end
  when 'windows'
    chocolatey_package 'chromedriver' do
      action :purge
    end
    
end