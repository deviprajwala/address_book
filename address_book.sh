#!/bin/bash

declare -A matrix
num_rows=10
num_columns=4
value=1

#we are using the list named record to store the details of a person
#index 1 is name,2 is surname,3 is email and 4 is phone number 
search()
{
 echo "enter the name:"
 read name
 for((i=1;i<=num_rows;i++))
 {
 
   if [[ "$name" = "${matrix[$i,1]}" ]]
   then
       echo "DETAILS ARE"
       echo "NAME:${matrix[$i,1]}"
       echo "SURNAME:${matrix[$i,2]}"
       echo "EMAIL:${matrix[$i,3]}"
       echo "PHONE:${matrix[$i,4]}"
   fi

 }
}

add()
{
   if [ $value -lt 10 ]
   then
       i=$value
       echo "enter name"
       read name 
       matrix[$i,1]=$name
       echo "enter surname"
       read surname
       matrix[$i,2]=$surname
       echo "enter email"
       read email
       matrix[$i,3]=$email
       echo "enter phone"
       read phone
       matrix[$i,4]=$phone
  fi
  value=$[$value+1]
  echo "Successfully added the user!"  
}

remove()
{
 echo "enter the name:"
 read name
 for((i=1;i<=num_rows;i++))
 {
 
   if [[ "$name" = "${matrix[$i,1]}" ]]
   then
       for((j=1;j<=num_columns;j++))
       {
         matrix[$i,$j]=0;
       }
   fi

 }
 echo Removed the user.
}

edit()
{
 echo "enter the name of user whoose details are to be edited"
 read name
 for((i=1;i<=num_rows;i++))
 {
 
   if [[ "$name" = "${matrix[$i,1]}" ]]
   then
       echo "DETAILS ARE"
       echo "NAME:${matrix[$i,1]}"
       echo "SURNAME:${matrix[$i,2]}"
       echo "EMAIL:${matrix[$i,3]}"
       echo "PHONE:${matrix[$i,4]}"
       echo "change name? enter y/n"
       read response
       if [[ "$response" = "y" ]]
       then
           echo "enter name"
           read name 
           matrix[$i,1]=$name
       fi
       echo "change surname? enter y/n"
       read response
       if [[ "$response" = "y" ]]
       then
       echo "enter surname"
       read surname
       matrix[$i,2]=$surname
       fi
       echo "change email? enter y/n"
       read response
       if [[ "$response" = "y" ]]
       then
       echo "enter email"
       read email
       matrix[$i,3]=$email
       fi
       echo "change phone number? enter y/n"
       read response
       if [[ "$response" = "y" ]]
       then
        echo "enter phone"
        read phone
        matrix[$i,4]=$phone
       fi
   fi
 }
}
display()
{
   for((i=1;i<$value;i++))do
   
    for((j=1;j<=num_columns;j++))do
       
         echo -n ${matrix[$i,$j] }
         echo
    done
    echo -e "\n";
  done  
}
#main function of the script


c=1
while [ $c -eq 1 ]
do
 echo "Enter 1 to add a user 
             2 to search for details 
             3 to remove the user 
             4 to edit details 
             5 to display"
 read input
 case $input in
 1)
   add 
   ;;
 2)
   search 
   ;;
 3)
   remove
   ;;
 4)
   edit
   ;;
 5)
   display
   ;;
 *)
  echo "invalid input"
  ;;
 esac
 echo "enter 1 to continue 0 to exit"
 read c
done
