#!/usr/bin/bash

## Test Case:

cd $db_n
echo "********************************* Delete row *****************************"

read -p "Table Name: " tb_n

if [[ $(awk 'END { print NR } ' $tb_n ) == 1 ]]; 
then
    echo "Table not include any information !!" 
    select te in  back_menu 
    do
    case $te in
    back_menu )
    cd ../
    . main_db.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done 

fi

#sed -n '1,5p' $tb_n

echo "please Enter the primary key of the record you want to delete"

read pk
coloumnsCount=$(awk -F: 'NR==1 {print NF}' $tb_n)
for (( i=1;i<$coloumnsCount;i++ ))
do
column=$(awk -F: 'FNR == 1 {print $'$i'}' $tb_n)
col_name=$(echo $column | cut -d "%" -f 1)
col_type=$(echo $column | cut -d "%" -f 2)
pk_f=$(echo $column | cut -d "%" -f 3)

if [[ $pk_f == "pk" ]]
then
echo "Column Name : $col_name , it's Type : $col_type : "



else
echo "Opps, its not primary key"
fi
done

#row=$(awk -F% '{{if(($2=='$pk')){print NR}}}' $tb_n )
#sed -i ''$row'd' $tb_n
#echo "done"
#    select te in delete_another_row back_menu 
#    do
#    case $te in
#    delete_another_row )
#    cd ../
#    . delete_row.bash;;
#    back_menu )
#    cd ../
#    . main_db.bash;;
#    * ) echo "Invaled Number" ;;
#    esac
#    done 