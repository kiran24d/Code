#
# Cookbook:: efkl
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

ver = '6.2.4'
url = "https://artifacts.elastic.co/downloads/kibana/kibana-#{ver}"
esip = '192.168.25.130'
allowip = '0.0.0.0'

case node['platform_family']
  when 'debian'
    remote_file '/tmp/kibana.deb' do
      source "#{url}-amd64.deb"
      show_progress true
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    execute 'install' do
      command 'apt install /tmp/kibana.deb '
      action :run
    end
    execute 'Kibana configuration' do
        command "sed -i 's/#server.host: \"localhost\"/server.host: \"#{allowip}\"/g' /etc/kibana/kibana.yml ; sed -i 's/#server.name: \"your-hostname\"/server.name: \"KIBANA-NODE\"/g' /etc/kibana/kibana.yml ; echo \"elasticsearch.url: \"http://#{esip}:9200\"\" >> /etc/kibana/kibana.yml"
        action :run
      end

    service 'kibana' do
      action [:start, :enable]
    end

  when 'fedora', 'rhel', 'amazon'
    remote_file '/tmp/kibana.rpm' do
      source "#{url}-x86_64.rpm"
      show_progress true
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    execute 'install' do
      command 'yum install /tmp/kibana.rpm'
      action :run
    end
    execute 'Kibana configuration' do
      command "sed -i 's/#server.host: \"localhost\"/server.host: \"#{allowip}\"/g' /etc/kibana/kibana.yml ; sed -i 's/#server.name: \"your-hostname\"/server.name: \"KIBANA-NODE\"/g' /etc/kibana/kibana.yml ; echo \"elasticsearch.url: \"http://#{esip}:9200\"\" >> /etc/kibana/kibana.yml"
      action :run
    end

  service 'kibana' do
    action [:start, :enable]
  end
  end