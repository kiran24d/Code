#
# Cookbook:: nexus-provisoner
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'java::oracle'

nexus3 'nexus' do
  vmoptions_variables(
    Xms: '500M',
    Xmx: '500M'
  )
  action :install
end

execute 'show default credentials' do
  command 'echo "Default Username : admin | Password : admin123"'
  live_stream true
  action :run
end
