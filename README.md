# KnightBites - Data

The purpose of this repo is to hold the csv files, sql build/schema, and automation files for the app "Knight Bites" for Calvin University's CS 262 class.

## Automation

The automation directory holds files "automateDiningData.py", "automatePrayers.py", and "automateUppercrust.py". These Python files utilize the pscog2 library to connect to the PSQL database. When run, data from input csv files are put into the existing database tables. 
These files were created due to the large amount of data entry that was needed for this project. 

## Data

The data directory holds csv files like "uppercrustdetail.csv", "DiningHall.csv", and "prayers.csv". 

## SQL

The SQL schema holds the tables that we created in the PSQL database. These include: 

1. diningfood
2. userprofiles
3. diningfoodratings
4. uppercrustdetail
5. prayers

