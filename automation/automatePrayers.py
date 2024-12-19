import pandas as pd
import psycopg2
from dotenv import load_dotenv
from os import getenv

diningData = pd.read_csv("prayers.csv").drop_duplicates(subset=['prayer'])

load_dotenv()
conn = psycopg2.connect(
    host=getenv("host"),
    database=getenv("database"),
    user=getenv("user"),
    password=getenv("password"),
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
