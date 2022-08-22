#!/usr/bin/bash

## Test Case:



echo "********************************* Create New Database *****************************"

# input Database
read -p "Your Database Name: " d_n

# check database if exist
if [[ -d $d_n ]];
then
        echo "Opps, Database name is already exist !!"
        select te in ceate_another_database back_menu 
        do
        case $te in
        ceate_another_database ) . create_db.bash;;
        back_menu ) . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

#check input include data or empty
elif [[ -z $d_n ]];
then
        echo "Opps, Please enter your database name ?!"
        select te in enter_the_database_name_again back_menu 
        do
        case $te in
        enter_the_database_name_again ) . create_db.bash;;
        back_menu ) . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

# check database if not exist
elif [[ ! -d $d_n ]] ;
then
mkdir $d_n
echo "The Database has been created successfully"
select te in add_another_database back_menu 
do
case $te in
add_another_database ) . create_db.bash ;;
back_menu ) . main.bash;;
 * ) echo "Invaled Number" ;;
esac
done
fi




