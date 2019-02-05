# mysql
This cookbook is used to install mysql sever and client

RUN_LIST USAGE : "recipe[mysql::Install-server]"
                 "recipe[mysql::Install-client]"

Find the inital password in home directory of the user which ran chef-client in the file :
mysql-initialpassword.txt

OR run chef-client -l info to check the password on Screen

To reset mysql initial password use the below command
mysqladmin --user=root --password="OLD_PASSWORD" password NEW_PASSWORD

OR use :

$ mysql -u root --skip-password

ALTER USER 'root'@'%' IDENTIFIED BY 'changeme';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'changeme' WITH GRANT OPTION;
FLUSH PRIVILEGES;

OR use :

ALTER USER USER() IDENTIFIED BY 'changeme';
