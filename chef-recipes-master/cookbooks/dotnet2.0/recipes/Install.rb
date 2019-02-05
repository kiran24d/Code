#
# Cookbook:: dotnet2.0
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'mono-msbuild::Install'

if node['platform'] == 'ubuntu' && node['platform_version'] == '16.04'
  cookbook_file '/etc/apt/trusted.gpg.d/microsoft.gpg' do
    source 'microsoft.gpg'
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end

  file '/etc/apt/sources.list.d/dotnetdev.list' do
    content 'deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main'
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end

  package 'apt-transport-https' do
    action :install
    not_if 'dpkg -S apt-transport-https'
  end

  apt_update 'update repo' do
    action :update
  end
  
  package 'dotnet-sdk-2.1.4' do
    action :install
    not_if 'dpkg -S dotnet-sdk-2.1.4'
  end

  package 'openssl' do
    action :install
    not_if 'dpkg -S openssl'
  end

  package 'nuget' do
    action :install
    not_if 'dpkg -S nuget'
  end

  execute 'Nuget update' do
    command 'nuget update -Self'
    action :run
  end
else
  Chef::Log.info('Its not Ubuntu 16.04 LTS OS')
end
