-- sql/procurement_queries.sql
-- Clean raw procurement data and compute key KPIs based on available columns

-- 1. Build cleaned_orders with actual delivery duration
DROP TABLE IF EXISTS cleaned_orders;
CREATE TABLE cleaned_orders AS
SELECT
    PO_ID                              AS order_id,
    Supplier                           AS supplier,
    Item_Category                      AS category,
    date(Order_Date)                   AS order_date,
    date(Delivery_Date)                AS delivery_date,
    Quantity                           AS quantity,
    Unit_Price                         AS unit_price,
    Quantity * Unit_Price              AS total_cost,
    CASE WHEN Defective_Units > 0 THEN 1 ELSE 0 END AS defect_flag,
    (julianday(Delivery_Date) - julianday(Order_Date)) AS lead_time
FROM "Procurement KPI Analysis Dataset"
WHERE Order_Date IS NOT NULL
  AND Delivery_Date IS NOT NULL
  AND Order_Status = 'Delivered';

-- 2. Supplier-level KPIs
DROP TABLE IF EXISTS supplier_kpis;
CREATE TABLE supplier_kpis AS
SELECT
    supplier,
    COUNT(*)                             AS total_orders,
    SUM(total_cost)                     AS total_spend,
    ROUND(AVG(lead_time), 2)            AS avg_lead_time_days,
    ROUND(AVG(defect_flag) * 100, 1)     AS defect_pct
FROM cleaned_orders
GROUP BY supplier;

-- 3. Category-level KPIs
DROP TABLE IF EXISTS category_kpis;
CREATE TABLE category_kpis AS
SELECT
    category,
    COUNT(*)                             AS total_orders,
    SUM(total_cost)                     AS total_spend,
    ROUND(AVG(lead_time), 2)            AS avg_lead_time_days,
    ROUND(AVG(defect_flag) * 100, 1)     AS defect_pct
FROM cleaned_orders
GROUP BY category;

-- 4. Monthly trends for spend and average delivery duration
DROP TABLE IF EXISTS monthly_trends;
CREATE TABLE monthly_trends AS
SELECT
    strftime('%Y-%m', order_date)      AS month,
    SUM(total_cost)                     AS total_spend,
    ROUND(AVG(lead_time), 2)            AS avg_lead_time_days
FROM cleaned_orders
GROUP BY month
ORDER BY month;
