#!/bin/bash

echo "🚀 Starting Docker dbt Project..."

echo "Loading CSV data..."
python load_data.py

echo "Running dbt models..."
dbt run

echo "Running dbt tests..."
dbt test

echo "Running snapshots..."
dbt snapshot

echo "Generating docs..."
dbt docs generate

echo "✅ Project Complete!"