#
# Cookbook:: Python
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform_family']
when 'debian'
  packages = %w(python2.7 python-pip)
  packages.each do |packs|
    package packs do
      action :remove
    end
  end
when 'fedora', 'rhel', 'amazon'
  package 'python' do
    action :remove
  end
when  'windows'
  windows_package 'Python 2.7.14' do
    installer_type :msi
    source 'https://www.python.org/ftp/python/2.7.14/python-2.7.14.amd64.msi'
    action :remove
  end

  windows_path 'Python PATH' do
    path              ';C:\Python27;C:\Python27\scripts'
    action            :remove
  end
end