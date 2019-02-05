#
# Cookbook:: packer
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'chocolatey::default'
ver = '1.2.0'
case node['platform_family']
  when 'debian', 'fedora', 'rhel', 'amazon'
    remote_file "./packer_#{ver}_linux_amd64.zip" do
      source "https://releases.hashicorp.com/packer/#{ver}/packer_#{ver}_linux_amd64.zip"
      owner 'root'
      group 'root'
      mode '0644'
      action :create
    end
    execute 'Extract' do
      command "unzip ./packer_#{ver}_linux_amd64.zip"
      action :run
    end
    execute 'Installation' do
      command 'mv ./packer /usr/bin/'
      action :run
    end
    file "./packer_#{ver}_linux_amd64.zip" do
      action :delete
    end

  when 'windows'
    chocolatey_package 'packer' do
      action :install
    end  
end
