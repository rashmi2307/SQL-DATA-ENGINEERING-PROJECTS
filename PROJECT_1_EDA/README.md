# 🔍 Exploratory Data Analysis w/ SQL: Data Engineer Skills Analysis

![Project Overview](../Images/1_1_Project1_EDA.png)

A SQL project exploring the remote Data Engineer job market using real-world job posting data. The goal was to identify the most in-demand skills, the highest-paying skills, and the skills that provide the best balance between demand and compensation.

---

## 🧾 Executive Summary (For Hiring Managers)

* ✅ Built **3 analytical SQL queries** to answer key questions about the Data Engineer job market
* ✅ Used **multi-table joins** across fact, dimension, and bridge tables
* ✅ Applied **aggregations, median salary calculations, and custom scoring metrics**
* ✅ Identified high-value skills based on **demand, salary, and overall market value**

If you only have a minute, review these:

1. [`Top Demanded Skills`](./01_top_demanded_skills.sql) – identifies the most requested skills for remote Data Engineers
2. [`Top Paying Skills`](./02_highest_paying_skills.sql) – analyzes the highest-paying skills and their demand
3. [`Optimal Skills`](./03_most_optimal_skills.sql) – combines salary and demand into a single ranking metric

---

## 🧩 Problem & Context

For anyone planning a career in Data Engineering, a common question is:

* 🎯 Which skills are most in demand?
* 💰 Which skills offer the highest salaries?
* ⚖️ Which skills provide the best balance of demand and compensation?

To answer these questions, I analyzed job posting data from a data warehouse built using a star schema design.

![Data Warehouse Schema](../Images/1_2_Data_Warehouse.png)

### Data Model

* **Fact Table:** `job_postings_fact`
* **Dimension Tables:** `company_dim`, `skills_dim`
* **Bridge Table:** `skills_job_dim`

The analysis focuses specifically on **remote Data Engineer positions** and uses salary data where available.

---

## 🧰 Tech Stack

* 🐤 **Query Engine:** DuckDB
* 🧮 **Language:** SQL
* 📊 **Data Model:** Star Schema
* 🛠️ **Development:** VS Code
* 📦 **Version Control:** Git & GitHub

---

## 📂 Repository Structure

```text
1_EDA/
├── 01_top_demanded_skills.sql
├── 02_top_paying_skills.sql
├── 03_optimal_skills.sql
└── README.md
```

---

## 🏗 Analysis Overview

### 1. Top Demanded Skills

Identified the most requested skills across remote Data Engineer job postings.

#### Key Findings

* SQL — **29,221 postings**
* Python — **28,776 postings**
* AWS — **17,823 postings**
* Azure — **14,143 postings**
* Spark — **12,799 postings**
* Airflow — **9,996 postings**
* Snowflake — **8,639 postings**
* Databricks — **8,183 postings**

**Insight:** SQL and Python dominate the market, while cloud platforms and modern data tools appear consistently across thousands of job postings.

---

### 2. Top Paying Skills

Calculated median salaries for skills appearing in at least 100 remote Data Engineer job postings.

#### Key Findings

| Skill      | Median Salary | Postings |
| ---------- | ------------- | -------- |
| Rust       | $210K         | 232      |
| Golang     | $184K         | 912      |
| Terraform  | $184K         | 3,248    |
| Neo4j      | $170K         | 277      |
| GraphQL    | $167.5K       | 445      |
| Kubernetes | $150.5K       | 4,202    |
| Airflow    | $150K         | 9,996    |

**Insight:** Infrastructure and cloud-focused skills such as Terraform, Kubernetes, and Airflow offer strong compensation while maintaining significant demand.

---

### 3. Optimal Skills (Demand + Salary)

Created a custom score using median salary and the natural logarithm of demand to identify skills that balance both market demand and earning potential.

#### Top Ranked Skills

| Skill     | Median Salary | Postings | Optimal Score |
| --------- | ------------- | -------- | ------------- |
| Terraform | $184K         | 193      | 0.97          |
| Python    | $135K         | 1,133    | 0.95          |
| SQL       | $130K         | 1,128    | 0.91          |
| AWS       | $137K         | 783      | 0.91          |
| Airflow   | $150K         | 386      | 0.89          |
| Spark     | $140K         | 503      | 0.87          |

**Insight:** While niche skills like Rust achieve the highest salaries, Terraform, Python, SQL, AWS, and Airflow provide a stronger balance between compensation and market demand.

---

## 📊 Overall Insights

* SQL and Python remain the foundation of modern Data Engineering roles.
* Cloud platforms (**AWS, Azure, GCP**) are consistently requested by employers.
* Infrastructure skills (**Terraform, Kubernetes, Docker**) command salary premiums.
* Airflow and Spark are among the most valuable tools due to their combination of demand and compensation.
* The strongest long-term skill combination appears to be:

  * SQL
  * Python
  * AWS
  * Airflow
  * Spark
  * Terraform

---

## 💻 SQL Skills Demonstrated

### Query Design

* Multi-table `INNER JOIN` operations
* Common filtering patterns with `WHERE`
* Grouped analysis using `GROUP BY`
* Aggregate calculations with `COUNT()` and `MEDIAN()`
* Result ranking using `ORDER BY` and `LIMIT`

### Analytical Techniques

* Demand analysis through skill frequency counts
* Salary analysis using median compensation
* Custom metric creation using logarithmic transformations (`LN()`)
* Filtering aggregated results with `HAVING`
* Handling missing salary values with `IS NOT NULL`

---

## 🎯 What I Learned

This project helped me practice translating business questions into SQL queries and reinforced the importance of balancing multiple metrics when evaluating data. Rather than focusing only on salary or demand, combining both perspectives provided a more realistic view of which skills offer the greatest value in the Data Engineering job market.
