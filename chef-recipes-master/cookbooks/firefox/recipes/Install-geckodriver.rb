#
# Cookbook:: firefox
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'chocolatey::default'
ver = '0.19.1'
case node['platform_family']
  when 'debian', 'fedora', 'rhel', 'amazon'
    remote_file "/tmp/geckodriver-v#{ver}-linux64.tar.gz" do
    source "https://github.com/mozilla/geckodriver/releases/download/v#{ver}/geckodriver-v#{ver}-linux64.tar.gz"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  bash 'install' do
    code <<-EOH
    cd  /tmp/
    tar -xvzf /tmp/geckodriver-v#{ver}-linux64.tar.gz
    chmod +x geckodriver
    mv geckodriver /usr/local/share/
    ln -s /usr/local/share/geckodriver /usr/local/bin/geckodriver
    ln -s /usr/local/share/geckodriver /usr/bin/geckodriver
    EOH
    action :run
    live_stream true
  end
when 'windows'
  chocolatey_package 'selenium-gecko-driver' do
    action :install
    not_if 'where selenium-gecko-driver'
  end
end