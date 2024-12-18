import pandas as pd
import psycopg2

diningData = pd.read_csv("uppercrustdetail.csv").drop_duplicates(subset=['ingredient'])

conn = psycopg2.connect(
    host="knightbites-db.postgres.database.azure.com",
    database="knightbitesdb",
    user="knightbitesadmin",
    password="BranchOften42!",
    sslmode="require"
)
cursor = conn.cursor()


for index, row in diningData.iterrows():
    cursor.execute("""
        INSERT INTO uppercrustdetail(ingredient, category)
        VALUES (%s, %s)
    """, (row['ingredient'], row['category']))

conn.commit()
cursor.close()
conn.close()
