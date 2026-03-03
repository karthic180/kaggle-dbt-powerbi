import os
import pandas as pd

DATA_PATH = "data"

files = {
    "orders": "olist_orders_dataset.csv",
    "customers": "olist_customers_dataset.csv",
    "order_items": "olist_order_items_dataset.csv",
}

def load_duckdb():
    import duckdb
    print("Using DuckDB...")
    con = duckdb.connect("project.duckdb")
    for table, filename in files.items():
        path = os.path.join(DATA_PATH, filename)
        df = pd.read_csv(path)
        con.execute(f"CREATE OR REPLACE TABLE {table} AS SELECT * FROM df")
    con.close()

def load_sqlite():
    import sqlite3
    print("Using SQLite...")
    con = sqlite3.connect("project.db")
    for table, filename in files.items():
        path = os.path.join(DATA_PATH, filename)
        df = pd.read_csv(path)
        df.to_sql(table, con, if_exists="replace", index=False)
    con.close()

try:
    load_duckdb()
except Exception as e:
    print("DuckDB failed:", e)
    load_sqlite()

print("✅ Data Loaded")