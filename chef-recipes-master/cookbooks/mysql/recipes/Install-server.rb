#
# Cookbook:: mysql
# Recipe:: Install
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['platform'] == 'ubuntu' && node['platform_version'] == '16.04'
    remote_file './mysql-5.7.22-linux-glibc2.12-x86_64.tar.gz' do
      source 'https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.22-linux-glibc2.12-x86_64.tar.gz'
      show_progress true
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    user 'mysql' do
      shell '/bin/false'
      action :create
    end
    bash 'Extract' do
      code <<-EOH
        mkdir -p /usr/local/mysql/{data,run} /var/log/mysql
        tar zxvf mysql-5.7.22-linux-glibc2.12-x86_64.tar.gz -C /usr/local/mysql --strip-components=1
        rm -f mysql-5.7.22-linux-glibc2.12-x86_64.tar.gz
        sed -i '\$aexport PATH=$PATH:/usr/local/mysql/bin' ~/.bashrc
        . ~/.bashrc
        chown -R mysql.mysql /usr/local/mysql
        chown -R mysql.mysql /var/log/mysql
      EOH
      action :run
    end
    package 'libaio1' do
      action :install
    end
    cookbook_file '/etc/my.cnf' do
      source 'my.cnf'
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    bash 'checksystem' do
      code <<-EOH
        op=`ps --no-headers -o comm 1`
        if [ $op == "systemd" ]; then
            echo '[Unit]
            Description=MySQL Server
            After=syslog.target
            After=network.target

            [Service]
            Type=simple
            ExecStart=/usr/local/mysql/bin/mysqld --defaults-file=/etc/my.cnf
            User=mysql
            PermissionsStartOnly=true
            WorkingDirectory=/usr/local/mysql
            TimeoutSec=300
            PrivateTmp=true
            [Install]
            WantedBy=multi-user.target' > /lib/systemd/system/mysql.service
            chmod 644 /lib/systemd/system/mysql.service
        else
            echo "its sysVinit"
        fi
      EOH
      action :run
    end
    execute 'initialize MySQL' do
      command '/usr/local/mysql/bin/mysqld  --initialize --user=mysql'
      action :run
    end
    execute 'Reload Daemon' do
      command 'systemctl daemon-reload'
      action :run
    end
    service 'mysql' do
      action [:start, :enable]
    end
    bash 'get-password' do
      code <<-EOH
      getpass=`grep -i "temporary password" /var/log/mysql/error.log | sed -n 's/.*root@localhost: //p'`
      echo "MYSQL PASSWORD = " $getpass > $HOME/mysql-initialpassword.txt
      EOH
      action :run
    end
else
    Chef::Log.info('Its not Ubuntu 16.04 LTS OS')
end