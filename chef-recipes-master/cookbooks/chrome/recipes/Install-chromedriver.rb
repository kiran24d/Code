#
# Cookbook:: chrome
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'chocolatey::default'

ver = 2.35
zipfile = 'chromedriver_linux64.zip'

case node['platform_family']
  when 'debian', 'fedora', 'rhel', 'amazon'
    remote_file "/tmp/#{zipfile}" do
      source "https://chromedriver.storage.googleapis.com/#{ver}/#{zipfile}"
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end

    bash 'install' do
      code <<-EOH
      cd  /tmp/
      unzip /tmp/#{zipfile}
      chmod +x chromedriver
      mv chromedriver /usr/local/share/
      ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
      ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
      EOH
      action :run
    end
  when 'windows'
    chocolatey_package 'chromedriver' do
      action :install
      not_if 'where chromedriver'
    end
    
end