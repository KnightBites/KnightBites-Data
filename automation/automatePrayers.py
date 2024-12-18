import pandas as pd
import psycopg2

diningData = pd.read_csv("prayers.csv").drop_duplicates(subset=['prayer'])

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
        INSERT INTO prayers(prayerTitle, prayer)
        VALUES (%s,%s)
    """, (row['prayerTitle'], row['prayer']))

conn.commit()
cursor.close()
conn.close()
