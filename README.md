# Procurement Pulse: Supplier Performance & Spend Dashboard

This project analyzes procurement data to uncover key insights on supplier performance, spending trends, and category efficiency using SQL, Excel, and Tableau.

---

## 🔍 Objective

Help procurement and supply chain teams:
- Monitor supplier KPIs (spend, lead time, defect rate)
- Identify high-value or high-risk suppliers
- Track monthly spend and delivery efficiency
- Improve procurement strategy using visual insights

---

## 📊 Dataset

- Source: [Kaggle Procurement KPI Dataset](https://www.kaggle.com/datasets/)
- Rows: 777 purchase orders
- Key Columns:
  - Supplier, Category, Quantity, Spend
  - Order & Delivery Dates
  - Lead Time, Compliance, Defects

---

## 💡 Tools & Technologies

- **Python**: Data ingestion and SQLite DB creation
- **SQLite**: Data storage and transformations via SQL
- **Excel**: Pivot tables & charts for trend analysis
- **Tableau**: Interactive dashboard and Pareto visualizations

---

## 🚀 How to Run This Project

### ✈️ Step 1: Load Data to SQLite
```bash
python3 scripts/load_data.py \
    --input data/processed/ \
    --output data/processed/procurement.db
✈️ Step 2: Run SQL Queries
    sqlite3 data/processed/procurement.db < sql/procurement_queries.sql

