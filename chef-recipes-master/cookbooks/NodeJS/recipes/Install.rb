#
# Cookbook:: NodeJS
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

lver = '8'
wver = '8.9.4'

case node['platform_family']
when 'debian'

execute 'Add Repo' do
    command "curl -sL https://deb.nodesource.com/setup_#{lver}.x | sudo -E bash -"
    action :run
    live_stream true
    not_if "dpkg -l nodejs"
end
package 'nodejs' do
    action :install
    not_if "dpkg -l nodejs"
end

when 'fedora', 'rhel', 'amazon'
execute 'Add Repo' do
  command "curl --silent --location https://rpm.nodesource.com/setup_#{lver}.x | sudo bash -"
  live_stream true
  action :run
end
package 'nodejs' do
    action :install
end

when 'windows'
  windows_package 'NodeJS 8.9.4' do
    installer_type	:msi
    source "https://nodejs.org/dist/v#{wver}/node-v#{wver}-x64.msi"
    action :install
    not_if 'where nodejs'
  end
end
