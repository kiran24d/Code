#
# Cookbook:: chrome
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform_family']
when 'fedora', 'rhel', 'amazon'
  package 'google-chrome' do
    action :remove
  end
when 'windows'
  windows_package 'Google chrome' do
    source 'https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B1FBF1F16-664A-FBD6-FE18-6EB5892D2665%7D%26lang%3Den%26browser%3D3%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue%26ap%3Dx64-stable-statsdef_1%26brand%3DGCEJ/dl/chrome/install/googlechromestandaloneenterprise64.msi'
    installer_type :msi
    action :remove
  end
end
