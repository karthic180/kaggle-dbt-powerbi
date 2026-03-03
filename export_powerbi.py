import duckdb
import os

OUTPUT_DIR = "powerbi/data"
os.makedirs(OUTPUT_DIR, exist_ok=True)

con = duckdb.connect("project.duckdb")

tables = [
    "fct_orders",
    "dim_customers",
    "customers_snapshot"
]

for table in tables:
    output_path = os.path.join(OUTPUT_DIR, f"{table}.csv")
    con.execute(f"COPY {table} TO '{output_path}' (HEADER, DELIMITER ',')")
    print(f"Exported {table} to {output_path}")

con.close()
print("✅ Power BI export complete")