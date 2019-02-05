# chrome

This cookbook is used to Install Google Chrome Browser and Driver

RUN_LIST USAGE : 
To install Google chrome browser use below recipes :
A)    "recipe[chrome::Install-browser]"

To  install  Chrome Driver use below recipes :
B)    "recipe[chrome::Install-chromedriver]"

To uninstall Google chrome browser use below recipes :
C)    "recipe[chrome::Uninstall-browser]"

To  uninstall  Chrome Driver use below recipes :
D)    "recipe[chrome::Uninstall-chromedriver]"

Dependencies : 
+ unzip
+ chocolatey
+ windows