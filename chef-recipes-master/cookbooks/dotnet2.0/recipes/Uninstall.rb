#
# Cookbook:: dotnet2.0
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'dotnet-sdk-2.1.4' do
  action :remove
  only_if 'dpkg -S dotnet-sdk-2.1.4'
end

package 'nuget' do
  action :remove
  only_if 'dpkg -S nuget'
end
