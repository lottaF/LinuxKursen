#! /bin/bash

# Generiskt script som läser in personlig info och lägger i en fil 
# i en fil med namnet om_xx.txt (där xx är namnet) och som användaren av scriptet har 
# exklusiv access till.

#  variabler (text): NAME, FILENAME

NAME=$1

if [ "${#NAME}" == 0 ]
then
  echo "You forgot to state your name"
  echo "Rerun the script - with the name as argument"
  exit
fi

echo "Hej $NAME !"
FILENAME="om_$NAME.txt"

echo "$NAME" > $FILENAME

chmod 600 $FILENAME

add_infoPair_toFile () {
  # Läser in färg och djur och adderar dessa på nya rader i filen. 
 
local COLOUR=""

while [ "${#COLOUR}" == 0 ] 
do
  read -p "Ange en favoritfärg: " COLOUR
done

local ANIMAL=""

while [ "${#ANIMAL}" == 0 ] 
do
  read -p "Ange ett favoritdjur: " ANIMAL
done

echo -e "$COLOUR\n$ANIMAL">> $FILENAME

}

add_infoPair_toFile

echo "Följande fil skapad:" 
ls -l $FILENAME

echo "Filen $FILENAME innehåller: " 
cat $FILENAME

