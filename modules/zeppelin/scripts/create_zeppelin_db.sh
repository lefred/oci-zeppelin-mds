#!/bin/bash



mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "CREATE USER ${zeppelin_name} identified by '${zeppelin_password}';"
mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "GRANT SELECT ON *.* TO ${zeppelin_name};"

echo "Zeppelin User created !"
echo "ZEPPELIN USER = ${zeppelin_name}"
