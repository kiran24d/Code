#
# Cookbook:: mono-msbuild
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
if node['platform'] == 'ubuntu' && node['platform_version'] == '16.04'
package 'mono-devel' do
  action :remove
  only_if 'dpkg -S mono-devel'
end
else
  Chef::Log.info('Its not Ubuntu 16.04 LTS OS')
end
