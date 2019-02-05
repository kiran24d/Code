case node['platform_family']
when 'fedora', 'rhel', 'amazon'
    package 'mysql' do
      action :install
    end
    
when 'debian'
    package 'mysql-client' do
      action :install
    end
    
end
