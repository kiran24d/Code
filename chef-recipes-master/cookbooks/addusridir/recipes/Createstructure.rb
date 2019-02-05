#
# Cookbook:: addusridir
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

env = 'qa'
username = 'piqa'
hdir = "/project/#{env}"

directory '/project/qa' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end
user 'piqa' do
  home '/project/qa'
  shell '/bin/bash'
  action :create
end

bash 'makedir' do
  code <<-EOH
  cd #{hdir}
  mkdir snapshots device-logs content script-runner offline-downloads mail-images java angular backups
  chown -R #{username}.#{username} #{hdir}
  EOH
  action :run
end
