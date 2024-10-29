import pandas as pd
import psycopg2

diningData = pd.read_csv("DiningHall.csv")
conn = psycopg2.connect(
    host="knightbites-db.postgres.database.azure.com",
    database="postgres",
    user="knightbitesadmin",
    password="BranchOften42!",
    sslmode="require"
)
cursor = conn.cursor()

for index, row in diningData.iterrows():
    cursor.execute("""
        INSERT INTO your_table (FoodName, DiningHall, MealTime, Vegan, Vegetarian, Halal)
        VALUES (%s, %s, %s)
    """, (row['FoodName'], row['DiningHall'], row['Mealtime'], row['Vegan'], row['Vegetarian'], row['Halal']))

conn.commit()
cursor.close()
conn.close()
