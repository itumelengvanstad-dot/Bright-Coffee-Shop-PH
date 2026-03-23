# Bright-Coffee-Shop-PH
This repository contains the complete Junior Data Analyst deliverables for the Bright Coffee Shop Sales Analysis case study.
**Project Overview**  
This repository contains the complete **Junior Data Analyst** deliverables for the **Bright Coffee Shop Sales Analysis** case study.  

The business has a new CEO with the mission to grow revenue and improve product performance. Using the historical transactional dataset (“Bright Coffee Shop Sales”), I extracted actionable insights on:  
- Which products generate the most revenue  
- What time of day the store performs best  
- Sales trends across products and time intervals  
- Recommendations for improving sales performance

- ---

## Objective (as per Project Brief)

- Identify top revenue-generating products  
- Determine peak performance hours  
- Analyse sales trends by product category/type and 30-minute intervals  
- Deliver clear, data-backed recommendations  

---

## Tools Used (Matching Project Guidelines)

| Category              | Tools Used                          |
|-----------------------|-------------------------------------|
| Project Planning      | Miro                                |
| Data Processing       | Databricks + Snowflake + SQL        |
| Analysis & Viz        | Microsoft Excel (Pivot Tables + Charts) |
| Presentation          | Microsoft PowerPoint                |
| Version Control       | GitHub                              |

---

## Methodology Summary

**Task 1 – Planning & Architecture (Miro)**  
- Designed full **Data Flow & Architecture Diagram** (source → ETL → Snowflake → Analysis → Presentation)  
- Listed key deliverables and calculations  

**Task 2 – Data Processing in Databricks**  
1. Converted original Excel → CSV  
2. Loaded into Snowflake  
3. Created `transaction_time_bucket` (30-minute intervals)  
4. Fixed `unit_price` (replaced commas with dots)  
5. Computed `total_amount = unit_price * transaction_qty`  
6. Aggregated by product category, type, detail, and time buckets  

**Task 3 – Data Analysis in Excel**  
- Exported processed table  
- Built interactive Pivot Tables & Charts:  
  - Total revenue per product type  
  - Peak time intervals  
  - Quantity sold by category  
  - Best-selling & under-performing products  

**Task 4 – Presentation to the CEO**  
- Separate **Methodology** document  
- Separate **Presentation** with visuals and recommendations  

---

## Key Calculations Performed

```sql
-- Example from analysis_queries.sql
SELECT 
    product_category,
    product_type,
    SUM(total_amount) AS total_revenue,
    SUM(transaction_qty) AS total_units,
    transaction_time_bucket
FROM processed_sales
GROUP BY product_category, product_type, transaction_time_bucket
ORDER BY total_revenue DESC;    
