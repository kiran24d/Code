#
# Cookbook::notepad++
# Recipe::install
#
# Copyright::2018, The Authors, All Rights Reserved.

case node['platform_family']
when 'debian'
  package 'nginx' do
    action:install
  end

when 'fedora', 'rhel', 'amazon'
  cookbook_file "/etc/yum.repos.d/nginx.repo" do
    source "nginx.repo.el"
    mode "0644"
  end

  execute "Update Yum" do
      command "yum update -y --nogpgcheck"
      live_stream true
  end

  package 'nginx' do
    action:install
  end

when 'windows'
    execute "Install Logmein" do
        command "choco install -y nginx"
        live_stream true
    end
end
