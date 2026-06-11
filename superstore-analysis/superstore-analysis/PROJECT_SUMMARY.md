# 📊 Superstore Sales Analysis — Complete Project

## Executive Summary
Comprehensive data analysis on 9,800 retail orders generating $2.26M in revenue 
across 4 regions and 3 product categories.

## Analysis Performed

### 1. Data Quality Assessment
- 9,800 complete orders with minimal missing data (0.11% in postal codes)
- 0 duplicate records
- 793 unique customers, 1,849 unique products

### 2. Statistical Analysis
- **Sales Distribution:** Highly right-skewed (skewness: 12.98)
- **Mean:** $230.77 | **Median:** $54.49 | **Max:** $22,638
- Clear presence of outliers and extreme values

### 3. Category Performance
| Category | Total Sales | Avg Order | Orders |
|----------|------------|-----------|--------|
| Technology | $827,455 | $456 | 1,813 |
| Furniture | $728,658 | $351 | 2,078 |
| Office Supplies | $705,422 | $119 | 5,909 |

### 4. Regional Insights
- **West:** $710,219 (31.4% of total) — strongest performer
- **East:** $669,518 (29.6%)
- **Central:** $492,647 (21.8%)
- **South:** $389,151 (17.2%) — needs improvement

### 5. Customer Segmentation
- **Consumer:** $1.15M (most valuable segment)
- **Corporate:** $688K
- **Home Office:** $424K

### 6. Top Customers
 Sean Miller: $25,000+
 Tamara Chand: $18,000+
 Raymond Buch: $16,000+

## Tools & Technologies
- **Python:** Pandas, Matplotlib, Seaborn
- **SQL:** Queries, CTEs, Window Functions
- **Excel:** Pivot Tables, Charts, Dashboards
- **Power BI:** Interactive dashboards with slicers
- **Statistics:** Distribution analysis, correlation, outlier detection

## Key Findings
1. Technology products drive highest revenue despite fewest orders
2. Office Supplies has high volume but low average value
3. West region significantly outperforms South region
4. Consumer segment is most profitable
5. Strong presence of outliers indicates potential VIP customer strategy

## Recommendations
1. Focus marketing on West region expansion
2. Develop loyalty program for top customers
3. Investigate South region underperformance
4. Create bundled Office Supplies offerings
5. Premium pricing strategy for Technology category

## Files in This Project
- `eda_analysis.py` — Complete Python EDA code
- `sql_queries.sql` — Advanced SQL analysis queries
- `dashboard_screenshot.md` — Power BI dashboard documentation
- `PROJECT_SUMMARY.md` — This file
