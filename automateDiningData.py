import pandas as pd
import psycopg2

diningData = pd.read_csv("DiningHall.csv").drop_duplicates(subset=['FoodName'])
bool_columns = ['Breakfast', 'Lunch', 'Dinner', 'Vegan', 'Vegetarian', 'Halal']
diningData[bool_columns] = diningData[bool_columns].astype(bool) #change 0s and 1s to Boolean type

conn = psycopg2.connect(
    host="knightbites-db.postgres.database.azure.com",
    database="knightbitesdb",
    user="knightbitesadmin",
    password="BranchOften42!",
    sslmode="require"
)
cursor = conn.cursor()

cursor.execute("DELETE FROM diningfood") #Clear existing to reautomate

for index, row in diningData.iterrows():
    cursor.execute("""
        INSERT INTO diningfood(FoodName, DiningHall, Breakfast, Lunch, Dinner, MealTime, Vegan, Vegetarian, Halal, Image, Description)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """, (row['FoodName'], row['DiningHall'], row['Breakfast'], row['Lunch'], row['Dinner'], row['Mealtime'], row['Vegan'], row['Vegetarian'], row['Halal'], row['Image'], row['Description']))

conn.commit()
cursor.close()
conn.close()
