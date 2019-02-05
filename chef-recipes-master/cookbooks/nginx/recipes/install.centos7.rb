#
# Cookbook Name:: nginx
# Recipe:: install.centos7
#
# Copyright 2017, Emerson Ecologics
#
# All rights reserved - Do Not Redistribute

cookbook_file "/etc/yum.repos.d/nginx.repo" do
    source "nginx.repo.centos7"
    mode "0644"
end

execute "Update Yum" do
    command "yum update -y --nogpgcheck"
end

package 'nginx' do
  action :install
end






