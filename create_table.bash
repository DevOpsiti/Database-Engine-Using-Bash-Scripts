#!/usr/bin/bash

## Test Case:

cd $db_n

echo "********************************* Create New Table *****************************"
read -p "Table Name: " tb_n

if [[ -f $tb_n ]];
then
        echo "Opps, Table name is already exist !!"
        select te in ceate_another_table back_menu 
        do
        case $te in
        ceate_another_table ) 
        cd ../
        . create_table.bash;;
        back_menu )
        cd ../
         . main_db.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done
elif [[ -z $tb_n ]]
then
        echo "Error, Please enter your Table name ?!"
        select te in enter_the_table_name_again back_menu 
        do
        case $te in
        enter_the_table_name_again )
        cd ../
         . create_table.bash;;
        back_menu )
        cd ../
         . main_db.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done
elif [[ $tb_n == $db_n ]];
then
echo "it is not allowed to enter the table name with the same name as the database"
        select te in try_again back_menu 
        do
        case $te in
        try_again ) 
        cd ../
        . create_table.bash;;
        back_menu ) 
        cd ../
        . main_db.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

elif [[ ! -f $tb_n ]]
then
touch $tb_n
echo "The Table has been created successfully"


select te in add_another_table back_menu 
do
case $te in
add_another_table )
cd ../
. create_table.bash ;;
back_menu ) 
cd ../
. main_db.bash;;
 * ) echo "Invaled Number" ;;
esac
done

fi
