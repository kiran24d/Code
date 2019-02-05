# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options
knife[:editor]="vim"
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "adminyogesh"
client_key               "/home/yogesh/ySPACE/chef-repo/admin.pem"
chef_server_url          "https://U2/organizations/myorg"
cookbook_path            ["#{current_dir}/../cookbooks"]
