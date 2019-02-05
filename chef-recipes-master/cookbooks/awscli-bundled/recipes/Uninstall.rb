#
# Cookbook:: awscli-bundled
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
case node['platform_family']
when 'fedora', 'rhel', 'amazon', 'debian'
  bash 'Uninstall' do
    code <<-EOH
    rm -fr /usr/local/aws
    rm /usr/local/bin/aws
    EOH
    action :run
  end
when 'windows'
  windows_package 'AWS-CLI' do
    installer_type :msi
    source 'https://s3.amazonaws.com/aws-cli/AWSCLI64.msi'
    action :remove
  end
end
