#
# Cookbook:: elk
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'efkl::Install-es'
include_recipe 'efkl::Install-logstash'
include_recipe 'efkl::Install-kibana'