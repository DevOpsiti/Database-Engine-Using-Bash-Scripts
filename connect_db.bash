#!/usr/bin/bash

## Test Case:


echo "********************************* Connect TO Database *****************************"
# User Input Data
read -p "Database Name: " db_n

# check input include data and not empty string
if [[ -z $db_n ]];
then
        echo "Opps, Please enter your database name ?!"
        select te in try_again back_menu 
        do
        case $te in
        try_again ) . connect_db.bash ;;
        back_menu ) . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

#check database is exist or not
elif [[ ! -d $db_n ]];
then
    echo "Opps, Database name is not exist !!"
        select te in try_again back_menu 
        do
        case $te in
        try_again ) . connect_db.bash ;;
        back_menu ) . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

elif [[ -d $db_n ]];
then
echo "Successfully"
. main_db.bash

fi

