# NodeJS

This cookbook is used to install NodeJS v8.9.4 

Update the variables with the required version and run the playbook for linux Envirnment updae       #{lver} and for windows update #{wver}
+ lver = 8
+ wver = 8.9.4 

RUN_LIST USAGE : "recipe[NodeJS::Install]"
                 "recipe[NodeJS::Uninstall]"

Dependencies : 
+ windows