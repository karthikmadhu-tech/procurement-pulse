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

- Source: [Kaggle Procurement KPI Dataset]([https://www.kaggle.com/datasets/](https://www.kaggle.com/datasets/shahriarkabir/procurement-kpi-analysis-dataset))
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
```

Once the script finishes, you should see:

```
Connected to database at data/processed/procurement.db  
Loading Procurement KPI Analysis Dataset.csv into table 'Procurement KPI Analysis Dataset'...  
Table 'Procurement KPI Analysis Dataset' loaded: 777 rows, 11 columns  
All files loaded. Database connection closed.
```

No need to manually end the process — the Bash command exits automatically when done. You can proceed to the next step.

### ✈️ Step 2: Run SQL Queries
```bash
sqlite3 data/processed/procurement.db < sql/procurement_queries.sql
```

### ✈️ Step 3: Explore Pivot Excel Workbook

Open `pivot_tables.xlsx` in the `excel/` folder to explore:
- Quarterly & Monthly spend and lead time trends
- Supplier-wise breakdowns

### ✈️ Step 4: Visualize in Tableau

Open `procurement_dashboard.twb` in the `dashboard/` folder to explore:
- Pareto chart of top suppliers by spend
- Monthly performance trends
- Defect analysis by category


---

## 🗓️ Time Period

- Covers: **January 2022 to December 2023**
- Enables seasonal and quarterly pattern analysis

---
## 📊 Key Insights

- ✅ Top 20% of suppliers contribute ~80% of total spend
- ✅ One product category shows the highest defect rate consistently
- ✅ Lead time improved significantly after Q2 2022

---
