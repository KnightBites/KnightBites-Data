import pandas as pd
import psycopg2
from dotenv import load_dotenv
from os import getenv

diningData = pd.read_csv("uppercrustdetail.csv").drop_duplicates(subset=['ingredient'])

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
        INSERT INTO uppercrustdetail(ingredient, category)
        VALUES (%s, %s)
    """, (row['ingredient'], row['category']))

conn.commit()
cursor.close()
conn.close()
