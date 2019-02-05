#
# Cookbook:: addusridir
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

env = 'qa'
username = 'piqa'
hdir = "/project/#{env}"


directory '/project' do
  recursive true
  action :delete
end

user 'piqa' do
  action :remove
end