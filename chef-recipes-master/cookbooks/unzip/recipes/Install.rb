#
# Cookbook:: unzip
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform_family']
when 'fedora', 'rhel', 'amazon', 'debian'
  package 'unzip' do
    action :install
  end
end