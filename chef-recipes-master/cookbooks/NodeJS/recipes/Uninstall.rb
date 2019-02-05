#
# Cookbook:: NodeJS
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

wver = '8.9.4'

case node['platform_family']
  when 'debian'
    package 'nodejs' do
        action :remove
        only_if "dpks -l nodejs"
    end
  when 'fedora', 'rhel', 'amazon'
    package 'nodejs' do
        action :remove
    end

  when 'windows'
    windows_package 'NodeJS 8.9.4' do
      installer_type	:msi
      source "https://nodejs.org/dist/v#{wver}/node-v#{wver}-x64.msi"
      action :remove
    end
end
