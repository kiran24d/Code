#
# Cookbook:: 7z
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
if node['platform'] == 'windows'
  windows_package '7z' do
    source "http://www.7-zip.org/a/7z1801-x64.msi"
    installer_type :msi
    action :remove
  end
  windows_path '7z PATH' do
    path              ';C:\Program Files\7-Zip'
    action            :remove
  end
else
  Chef::Log.info('7z  can only be Uninstalled from Windows OS')
end
