#
# Cookbook:: mono-msbuild
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
if node['platform'] == 'ubuntu' && node['platform_version'] == '16.04'
execute 'Add microsoft-key' do
  command 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF'
  action :run
end

execute 'Add repo' do
  command 'echo "deb http://download.mono-project.com/repo/ubuntu stable-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list'
  action :run
end

apt_update 'Update Repo' do
  action :update
end

package 'mono-devel' do
  action :install
  not_if 'dpkg -S mono-devel'
end
else
  Chef::Log.info('Its not Ubuntu 16.04 LTS OS')
end