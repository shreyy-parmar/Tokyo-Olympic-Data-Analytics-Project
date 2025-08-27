# Tokyo-Olympic-Data-Analytics-Project
This project is an end-to-end Azure Data Engineering solution designed to process, transform, and analyze data from the Tokyo Olympics. The architecture leverages a modern cloud-based data pipeline to ingest raw data, perform large-scale transformations, and store the results in a format ready for analytical querying and reporting.

# Tokyo Olympic Data Analytics | End-To-End Azure Data Engineering Project

## Project Overview

This project is an end-to-end **Azure Data Engineering** solution designed to process, transform, and analyze data from the Tokyo Olympics. The architecture leverages a modern cloud-based data pipeline to ingest raw data, perform large-scale transformations, and store the results in a format ready for analytical querying and reporting.

The final goal is to create a scalable and reliable data platform that serves as the single source of truth for Olympic data, enabling deeper insights into athlete performance, medal tallies, and event statistics.

## Architecture & Workflow

The project follows a medallion architecture (Bronze -> Silver -> Gold) and is implemented using the following Azure services:

### 1. Data Integration & Ingestion (Azure Data Factory)
*   **Role:** Serves as the orchestration engine for the entire pipeline.
*   **Responsibilities:**
    *   Connecting to various **Data Sources** (e.g., CSV files, APIs, databases).
    *   Copying the raw, unprocessed data from the source systems.
    *   Initiating and monitoring the subsequent transformation jobs in Databricks.

### 2. Raw Data Storage - Bronze Layer (Azure Data Lake Gen2)
*   **Role:** Acts as the central, immutable repository for all ingested data in its original format.
*   **Purpose:** This "landing zone" ensures we always have a copy of the source data for audit trails, reprocessing, and debugging.

### 3. Transformation & Processing - Silver/Gold Layers (Azure Databricks)
*   **Role:** This is the core processing engine where the raw data is cleansed, enriched, and transformed.
*   **Key Activities:**
    *   **Data Cleansing:** Handling missing values, standardizing formats, and correcting errors.
    *   **Data Enrichment:** Joining multiple datasets (e.g., athletes, teams, events, medals).
    *   **Advanced Transformations:** Performing aggregations, pivoting, and feature engineering to create an analysis-ready dataset.
    *   The transformed data is written back to the Data Lake in a structured format (e.g., Parquet/Delta Lake).

### 4. Analytical Data Store & Querying (Azure Synapse Analytics)
*   **Role:** The transformed data from ADLS Gen2 is loaded into Synapse Analytics.
*   **Purpose:** This distributed analytics engine allows for running complex, large-scale queries on the prepared dataset using T-SQL, providing high-performance analytical capabilities.

### 5. Data Visualization & Reporting (Note)
*   **Tool:** Power BI Desktop + Power BI Service
*   **Status:** **Not Implemented in this Project Phase.**
*   **Note:** The final step of creating interactive dashboards and reports in Power BI is typically the responsibility of a **Data Analyst**. The output of this pipeline—the curated dataset in Synapse Analytics—is the ideal source for such reporting.

## Technology Stack

| Service Category          | Azure Service Used       | Purpose                                                |
| ------------------------- | ------------------------ | ------------------------------------------------------ |
| **Data Orchestration**    | Azure Data Factory       | Automated data pipeline orchestration and scheduling   |
| **Data Storage**          | Azure Data Lake Gen2     | Scalable storage for raw and transformed data          |
| **Data Processing**       | Azure Databricks         | Distributed data transformation using Apache Spark     |
| **Data Warehousing**      | Azure Synapse Analytics  | Cloud data warehouse for analytical querying           |
| **Data Visualization**    | Power BI                 | **Note: This is the next step for a Data Analyst.**    |

## Project Structure

## How to Run the Pipeline

1.  **Prerequisites:**
    *   An active Azure subscription.
    *   Provisioned resources: Data Lake Gen2, Azure Data Factory, Databricks Workspace, Synapse Analytics.

2.  **Execution Flow:**
    *   The pipeline is triggered on a schedule or manually from **Azure Data Factory**.
    *   ADF copies the source data into the `raw/` container in **Data Lake Gen2**.
    *   ADF calls a **Databricks** notebook to perform the transformation.
    *   The Databricks notebook reads the raw data, processes it, and writes the results to the `processed/` container.
    *   The transformed data is then loaded into dedicated tables in **Synapse Analytics** (via PolyBase or COPY INTO).
    *   The data in Synapse is now ready for querying.

## Next Steps & Future Work

The data engineering lifecycle is complete. The next phase, which falls under data analysis, would involve:

*   **Connecting Power BI** directly to the Azure Synapse Analytics dedicated SQL pool.
*   **Data Modeling:** Building a semantic data model within Power BI.
*   **Report Development:** Designing and publishing interactive dashboards to derive insights from the transformed data.

## Roles and Responsibilities

*   **Data Engineer:** Responsible for the implementation of this entire pipeline—from ingestion (ADF) through transformation (Databricks) to loading (Synapse).
*   **Data Analyst:** Responsible for consuming the final dataset from Synapse in a tool like Power BI to create reports and dashboards for business users.

---

*This project was created to demonstrate a real-world cloud data engineering workflow on Azure.*
