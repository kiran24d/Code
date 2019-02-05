#
# Cookbook:: firefox
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
if node['platform'] == 'windows'
  windows_package 'Firefox ESR' do
    source 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/52.6.0esr/win64/en-GB/Firefox%20Setup%2052.6.0esr.exe'
    installer_type :custom
    options '-ms'
    action :install
  end
else
  Chef::Log.info('Firefox can only be Installed on Windows OS')
end
