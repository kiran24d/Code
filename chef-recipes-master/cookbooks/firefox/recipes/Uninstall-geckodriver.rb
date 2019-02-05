case node['platform_family']
  when 'debian', 'fedora', 'rhel', 'amazon'
  bash 'Uninstall' do
    code <<-EOH
    rm -fr /usr/local/share/geckodriver
    rm -f /usr/local/bin/geckodriver
    rm -f /usr/bin/geckodriver
    EOH
    action :run
    live_stream true
  end
when 'windows'
  chocolatey_package 'selenium-gecko-driver' do
    action :purge
  end
end