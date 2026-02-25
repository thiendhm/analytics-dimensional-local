# Dimensional modeling daily sales from inventory transactions
## Author: Thien Dao

## Problem
- inventory transaction per id, no meaning for value trend
## Solution
- staging: load data from csv file
- refined:
    - create dimension for product details
    - aggregate transaction into daily value for each product
    - create value column for revenue, cost and profit based on price, cost
## What next
    - update staging that load data from google big query
    - model for incremental load daily value into data warehouse
    - setup daily refresh dashboard connect to data warehouse