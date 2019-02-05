#
# Cookbook:: robot-framework
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['platform'] == 'windows'
  execute 'Uninstall' do
    command 'pip.exe uninstall robotframework robotframework-selenium2library -y'
    action :run
    live_stream true
  end
else
  Chef::Log.info('Robot-Framework  can only be Uninstalled from  Windows OS')
end
