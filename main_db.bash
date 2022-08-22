#!/usr/bin/bash

echo "-------------------------> Choose what operation you want to do !! <---------------------------"

select num in Create_Table List_All_Table Delete_Of_Table back_to_database
do
case $num in
Create_Table ) 
. create_table.bash;;
List_All_Table ) 
. list_db.bash;;
Delete_Of_Table ) 
. delete_table.bash;;
back_to_database ) 
 . main.bash;;
* ) echo "Invaled Number"

esac
done