# efkl

This cookbook can be used to install ELK stack or individual package.

RUN_LIST USAGE : "recipe[mysql::Install-server]"
                 "recipe[mysql::Install-client]"

Set  the ElasticSearch IP at :

esip = '192.168.25.130' in Install-kibana.rb if you want to configure ElasticSearch