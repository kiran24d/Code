# firefox

This cookbook is used to Install Firefox Browser and Gecko Driver

RUN_LIST USAGE : 
To install Firefox browser on windows use below recipes :
A)    "recipe[firefox::Install-browser]"

To  install  Gecko Driver use below recipes :
B)    "recipe[firefox::Install-geckodriver]"

To uninstall Firefox browser use below recipes :
C)    "recipe[firefox::Uninstall-browser]"

To  uninstall  Gecko Driver use below recipes :
D)    "recipe[firefox::Uninstall-geckodriver]"

Dependencies : 
+ chocolatey
