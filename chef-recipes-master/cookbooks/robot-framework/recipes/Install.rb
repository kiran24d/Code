#
# Cookbook:: robot-framework
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['platform'] == 'windows'
  execute 'Robot Framework' do
    command 'pip.exe install robotframework robotframework-selenium2library'
    action :run
    live_stream true
  end
else
  Chef::Log.info('Robot-Framework  can only be Installed on Windows OS')
end
