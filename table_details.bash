#!/usr/bin/bash

## Test Case:
cd $db_n
fields=1
separator=":"
echo "Enter your Number of Column"
read  fn

while [[ -z $fn ]]
do
echo "Opps, Please Enter Number of Column ?!"
echo "Enter your Number of Column"
read  fn
done

while [[ $fn -lt $fields ]]
do
echo "Opps, There is a syntax error"
echo "Enter your Number of Column"
read  fn
done

while [[ $fields -le $fn ]]
do
echo "Enter Name of column Number $fields"
read cn
while [[ -z $cn ]] || [[ $cn == *[0-9]* ]]
do
        echo "Opps, Please enter column Number ?!!"
        echo "Enter Name of column Number $fields"
        read cn
done

    select typ in int string
    do
       case $typ in
                 int )
                      colType="int"
                      break;;
               string )
                       colType="string"
                       break;;
                * ) echo "Invalid Number";;

        esac
    done

    echo "Do you want to make it a Primary Key? [Y/N]"
    select tp in Yes No
    do
    case $tp in
            Yes )
            pk="pk"
            break;;
            No )
            pk=""
            break;;
            * ) echo "Invalid Number";;
            esac
    done

metadata+="$cn""%""$typ""%""$pk""$separator"
((fields=$fields + 1 ))
done
echo $metadata >> $tb_n
echo "Table create successfuly"

