#
# Cookbook:: awscli-bundled
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
case node['platform_family']
when 'fedora', 'rhel', 'amazon', 'debian'

    remote_file './awscli-bundle.zip' do
    source 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    end

    execute 'unzip' do
    command 'unzip ./awscli-bundle.zip'
    action :run
    end

    execute 'Install AWS-CLI' do
    command './awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws'
    action :run
    end

    file './awscli-bundle.zip' do
    action :delete
    end
when 'windows'
  windows_package 'AWS-CLI' do
    installer_type :msi
    source 'https://s3.amazonaws.com/aws-cli/AWSCLI64.msi'
    action :install
  end
end
