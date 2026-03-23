# retail-sales-ai-automation-pipeline
End-to-end retail sales analytics pipeline using  Python, Groq AI API, PostgreSQL, Make.com webhook  automation, and Power BI dashboard. Automated data  cleaning, AI-generated insights, and webhook  notifications on 100K+ retail transactions.

## Problem Statement

A retail business had 101,000+ raw transaction records
with serious data quality issues and no way to track
business performance.

Business could not answer:
- Which products and categories are most profitable?
- Is revenue growing or declining month by month?
- Which sales channel is performing better?
- What is the average value of each customer order?

---

## Solution

Built a complete end-to-end automated analytics pipeline
using Python, SQL, AI API, and automation tools.

---

## Pipeline

Raw CSV (101K rows)
      ↓
Python EDA — understand the data
      ↓
Python Cleaning — fix all issues automatically
      ↓
PostgreSQL — calculate business KPIs
      ↓
Groq AI API — generate insights automatically
      ↓
Make.com Webhook — send email notification
      ↓
Power BI — interactive dashboard


## Tools Used

| Tool | Purpose |
|---|---|
| Python (Pandas, Matplotlib) | EDA and automated cleaning |
| PostgreSQL | KPI SQL queries |
| Groq AI API | Auto generate business insights |
| Make.com | Webhook automation workflow |
| Power BI | Interactive dashboard |
| GitHub | Project documentation |

---

## Data Cleaning Summary

| Issue | Action | Rows Affected |
|---|---|---|
| Duplicate orders | Removed | 1,000 |
| Negative quantity | Removed | 800 |
| Zero unit price | Removed | 400 |
| Region name typos | Fixed | 20+ |
| Wrong discount scale | Corrected 0-100 to 0-1 | All |
| Missing CustomerID | Filled with UNKNOWN | 8,079 |
| Missing ProductName | Deleted | 3,028 |
| Whitespace in names | Trimmed | All |

Final clean dataset: 95,859 records

---

## SQL Queries Written

- Total Revenue — SUM, COUNT DISTINCT
- Profit Margin by Category — GROUP BY
- Month over Month Growth — LAG() window function
- Average Order Value — COUNT DISTINCT OrderID
- Revenue by Region
- Top 10 Products by Revenue

---

## Key Results

| KPI | Value |
|---|---|
| Total Revenue | $143M |
| Profit Margin | 40.76% |
| Average Order Value | $1,492.65 |
| Total Orders | 95,859 |
| Reporting Time Saved | 20% |

---

## AI Integration

Used Groq AI API to automatically generate
business insights from KPI data.

No manual analyst writing needed.
Insights generated in seconds automatically.

---

## Automation Workflow

Built Make.com webhook automation:

Python script completes
      ↓
Fires webhook to Make.com
      ↓
Make.com sends email notification
with full KPI summary automatically



## Key Business Insights

1. Revenue showed alternating MoM growth pattern
   suggesting promotional cycles

2. Electronics had highest revenue AND highest margin
   making it the most valuable category

3. Online channel drives 33.8% of total revenue
   showing strong digital growth opportunity

---

## Files in This Repository

| File | Description |
|---|---|
| 01_eda.ipynb | Python EDA notebook |
| 02_cleaning.py | Automated cleaning script |
| 03_ai_insights.ipynb | Groq AI + Webhook code |
| retail_queries.sql | All SQL queries |
| retail_sales_clean.csv | Clean dataset |
| make_workflow.png | Make.com automation screenshot |
| make_email.png | Automated email received |



## How to Use AI in This Project

- Used Groq AI API to auto generate insights
- Used ChatGPT to generate Python EDA script
- Used Claude AI to generate cleaning script
- Used Claude AI to write SQL queries
- Prompt engineering used throughout



5. Check "Add README file"
6. Click Create Repository
7. Click on README.md file
8. Click pencil icon to edit
9. Delete existing content
10. Paste above content
11. Click Commit changes
