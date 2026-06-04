# 🏗️ Data Warehouse & Data Mart Build with SQL

A data engineering project where I built an end-to-end ETL pipeline that loads raw job posting data into a star schema data warehouse and creates analytical data marts for reporting and analysis.

![Data Pipeline Architecture](../Images/1_2_Project2_Data_Pipeline.png)

---

## 🧾 Project Overview

This project helped me practice core data engineering concepts including:

* Building a **star schema data warehouse**
* Designing **fact, dimension, and bridge tables**
* Creating an **ETL pipeline using SQL**
* Developing **data marts** for different analytical use cases
* Implementing **incremental updates using MERGE statements**
* Working with data stored in **Google Cloud Storage**

The goal was to transform raw job posting data into a structured system that supports efficient analysis and reporting.

---

## 🧩 Problem & Context

Raw job posting data is stored as CSV files and is not optimized for analytical queries.

To make the data easier to analyze, I built a pipeline that:

1. Extracts job posting data from cloud storage
2. Transforms and normalizes the data
3. Loads it into a star schema data warehouse
4. Creates specialized data marts for specific business questions

This project simulates a common data engineering workflow where raw operational data is converted into a reliable analytical layer.

---

## 🧰 Tech Stack

* 🐤 **Database:** DuckDB
* 🧮 **Language:** SQL
* ☁️ **Storage:** Google Cloud Storage (GCS)
* 📊 **Data Modeling:** Star Schema
* 🛠️ **Development:** VS Code
* 📦 **Version Control:** Git & GitHub

---

## 📂 Repository Structure

```text
2_WH_Mart_Build/
├── 01_create_tables_dw.sql
├── 02_load_schema_dw.sql
├── 03_create_flat_mart.sql
├── 04_create_skills_mart.sql
├── 05_create_priority_mart.sql
├── 06_update_priority_mart.sql
├── 07_create_company_mart.sql
├── build_dw_marts.sql
└── README.md
```

---

## 🏗️ Pipeline Architecture

![Data Pipeline Architecture](../Images/1_2_Project2_Data_Pipeline.png)

The pipeline loads raw job posting data into a centralized warehouse and then creates multiple data marts designed for different analytical use cases.

### Data Warehouse

The warehouse follows a star schema design consisting of:

* `job_postings_fact`
* `company_dim`
* `skills_dim`
* `skills_job_dim`

**Purpose:** Create a single source of truth for downstream analysis.

---

### Flat Mart

A denormalized table created by joining warehouse tables together.

![Flat Mart Schema](../Images/1_2_Flat_Mart.png)

**Purpose:**

* Simplify ad-hoc analysis
* Reduce query complexity
* Improve reporting usability

**SQL File:** [`03_create_flat_mart.sql`](./03_create_flat_mart.sql)

---

### Skills Mart

Aggregated skill demand data organized by month and job title.

![Skills Mart Schema](../Images/1_2_Skills_Mart.png)

**Purpose:**

* Analyze skill demand trends over time
* Support reporting on hiring patterns
* Track changes in technology demand

**SQL File:** [`04_create_skills_mart.sql`](./04_create_skills_mart.sql)

---

### Priority Mart

Tracks important job postings and supports incremental updates.

![Priority Mart Schema](../Images/1_2_Priority_Mart.png)

**Purpose:**

* Monitor priority job roles
* Demonstrate production-style update patterns
* Practice SQL MERGE operations

**SQL Files:**
- [`05_create_priority_mart.sql`](./05_create_priority_mart.sql)
- [`06_update_priority_mart.sql`](./06_update_priority_mart.sql)

---

### Company Mart

Aggregated hiring information by company, location, and role.

![Company Mart Schema](../Images/1_2_Company_Mart.png)

**Purpose:**

* Analyze hiring trends
* Compare company recruitment activity
* Support business-focused reporting

**SQL File:** [`07_create_company_mart.sql`](./07_create_company_mart.sql)

---

## 💻 SQL & Data Engineering Skills Demonstrated

### ETL Development

* Extracting CSV data from Google Cloud Storage
* Transforming and cleaning source data
* Loading data into warehouse tables
* Building repeatable ETL workflows
* Creating automated pipeline execution scripts

### Data Modeling

* Star schema design
* Fact and dimension table modeling
* Many-to-many relationships using bridge tables
* Defining table grain and business keys
* Creating analytical data marts

### SQL Techniques

* Complex joins
* Common Table Expressions (CTEs)
* Aggregations and grouping
* Date transformations
* String manipulation functions
* MERGE statements for incremental updates
* Data validation queries

### Data Engineering Best Practices

* Idempotent scripts (`DROP TABLE IF EXISTS`)
* Logical schema organization
* Consistent naming conventions
* Incremental loading patterns
* Data quality verification
* Reusable SQL components

---

## 🎯 What I Learned

Through this project, I gained hands-on experience with the data warehouse layer of the modern data stack. I learned how raw data is transformed into structured analytical models and how data marts can be designed to support different business needs.

The project also strengthened my understanding of dimensional modeling, ETL development, SQL-based data transformation, and production-oriented practices such as incremental updates and pipeline organization.
