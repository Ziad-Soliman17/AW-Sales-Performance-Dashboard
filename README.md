# AW-Sales-Performance-Dashboard
A rep-level sales performance dashboard built in Power BI, designed to give sales managers and reps a single-pane view of sales performance, customer mix, product trends, and quota attainment.

![image alt](https://github.com/Ziad-Soliman17/AW-Sales-Performance-Dashboard/blob/0b8a4cde37b6da97ca292645efeddf8cfcc3f8a7/Sales%20Rep%20Dashboard.png)

---
 
## Project Overview
This dashboard was built to monitor and evaluate the sales performance of individual sales representatives across a full year. It enables both reps and their managers to track actuals against prior year and quota targets, identify top-performing products and resellers, and spot seasonal trends — all from a single, filterable view.
 
The dashboard is scoped to one rep at a time (selectable via dropdown) and supports quarterly filtering, making it suitable for QBRs (Quarterly Business Reviews), 1:1 coaching sessions, and annual performance reviews.

Data is filtered to  years **2012–2013**, with quota data scoped to **2013** to align with the reporting period.
 
**Source**: Microsoft AdventureWorks Data Warehouse  
**Files**: SQL scripts and .pbix file included in this repository

---
 
## Tools & Stack
 
- Power BI Desktop - Report authoring and DAX development
- Power Query - Data transformation and loading
- DAX - All KPI measures and time intelligence
- SQL Server - Underlying data source (AdventureWorks schema) 
 
---
 
## Objectives
 
- Track total sales, order volume, and quantity versus prior year (PY)
- Monitor quota attainment at any point in time
- Identify which product categories are growing or declining
- Surface the top resellers driving 80% of revenue (Pareto principle)
- Reveal which individual products contribute the most to rep revenue
---
 
## Data Model
All tables were extracted from the **AdventureWorksDW** database using SQL queries and loaded directly into Power BI via SQL Server connector. Each query maps to one table in the data model.
The report is built on a **star schema** connecting a central fact table to supporting dimension tables.


---
  
### Power BI Features
- **Slicers** — Employee dropdown and Quarter toggle buttons for dynamic filtering
- **Card visuals** — KPI cards with conditional formatting (red/green delta badges)
- **Combo chart** — Line + clustered bar for the Pareto reseller chart (bar = sales per reseller, line = cumulative % to 80%)
- **Line chart** — CY YTD vs PY sales trend with per-month delta annotations
- **Donut chart** — Sales split by business type (Value Added Reseller, Warehouse, Specialty Bike Shop)
- **Bar chart** — Top/Bottom N products with a field parameter toggle (Sales, Quantity)
- **Matrix table** — Category breakdown with expandable product rows and conditional growth formatting
- 
### DAX Techniques
- `CALCULATE()` for filter context manipulation
- `ALL()` for removing filters to calculate totals and percentages
- `SWITCH()` for conditional logic and dynamic measure selection
- `RANKX()` for dynamic Top N / Bottom N product ranking
- `SELECTEDVALUE()` for responding to slicer and parameter selections
- `SUM()` and `DISTINCTCOUNT()` for core aggregations
- `VAR` / `RETURN` for readable, step-by-step measure logic
- Field parameters for the Top/Bottom toggle on the product bar chart

---
 
## Business Rationale — Why These Charts Reflect Sales Rep Performance
 
### 1. KPI Cards (Total Sales, Quantity, Orders, Quota)
Sales alone can be misleading — tracking volume and orders together reveals whether growth is price-driven or demand-driven.
Quota attainment is the single most executive-relevant metric, answering "did this rep hit their number?" at a glance.
 
### 2. CY YTD vs PY Sales Trend (Line Chart)
Comparing current year to prior year shows whether performance is improving structurally or simply riding seasonal patterns.
Monthly delta labels help managers pinpoint exactly when a rep was strong or struggling — essential for coaching conversations.
 
### 3. Category Sales Breakdown (Matrix Table)
A rep concentrated in one category is a business risk; this table exposes whether the rep is selling across the full portfolio.
Growing categories signal upsell opportunities worth replicating, while declining ones flag where coaching is needed.
 
### 4. Sales by Business Type (Donut Chart)
Who a rep sells to matters as much as how much they sell — channel mix reveals strategic focus and potential blind spots.
This view helps managers guide reps toward a more balanced and resilient account base.
 
### 5. Top Resellers — Pareto Chart (80/20 Analysis)
A small number of resellers typically drive the majority of a rep's revenue, making concentration a key risk to monitor.
This chart surfaces which relationships are critical and how exposed the rep would be if a top account were lost.
 
### 6. Sales by Product — Top/Bottom Toggle (Bar Chart)
The Top view shows which products resonate with the rep's customers. The Bottom view surfaces what needs attention or repositioning.
Together they inform smarter territory planning and targeted product training decisions.

 ---
 
## How to Use
1. Select a **sales rep** from the Employee dropdown (top right)
2. Filter by **quarter** using the Qtr 1–4 toggle buttons, or leave all selected for full-year view
3. Hover over any chart for detailed tooltips
4. Click a **category row** in the breakdown table to cross-filter all visuals
5. Toggle **Top / Bottom** on the product bar chart to switch ranking direction and enter the number of products to display
