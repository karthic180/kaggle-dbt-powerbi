## 🚀 Quick Start (No Install Required)

### Option 1 — Docker (Recommended)

```bash
docker compose up
Option 2 — Windows
.\scripts\bootstrap.ps1
Option 3 — Mac/Linux
./scripts/bootstrap.sh

After completion:

Open Power BI Desktop
Import CSV from powerbi/data
### Running dbt Manually

After activating venv:

dbt run --target duckdb
dbt test --target duckdb
dbt snapshot --target duckdb
## Requirements (Non-Docker Mode)

Python 3.10+

dbt-duckdb

duckdb

pandas

All installed automatically via bootstrap.
## Database Engines

This project supports:

Engine	Purpose
DuckDB	Primary analytics engine
SQLite	Fallback engine


License

MIT License
See LICENSE file.