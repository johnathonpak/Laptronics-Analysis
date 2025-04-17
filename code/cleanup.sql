/*
SQL Code for Data Clean Up.

Key Notes for cleanup:
1. Table geo_lookup has incorrect/ missing field names
2. Missing data in field REFUND_TS on cleaned version of orders_raw is normal
3. Missing COUNTRY_CODE from orders_raw table can be possibly filled using other tables
4. Missing MARKETING_CHANNEL and ACCOUNT_CREATION_METHOD from orders_raw table can be possibly filled using other tables. This also applies vice versa
*/


-- Due to the nature of BigQuery, we will create a new table with correct field
CREATE OR REPLACE TABLE `data-analysis-projects-456521.laptronics_data.geo_lookup_new` AS 
SELECT 
  string_field_0 AS country,
  string_field_1 AS region
FROM data-analysis-projects-456521.laptronics_data.geo_lookup;


/* 
Check count of null rows in each column and look at details of each
*/

SELECT 
  COUNT(CASE WHEN country IS NULL THEN 1 END) AS country_null_count,
  COUNT(CASE WHEN region IS NULL THEN 1 END) AS region_null_count
FROM 
    data-analysis-projects-456521.laptronics_data.geo_lookup_new;

/* 
Results:
country null = 0 
region null = 2
*/


SELECT country, region
FROM data-analysis-projects-456521.laptronics_data.geo_lookup_new
WHERE region IS NULL;

-- Upon inspection, the 2 countries we are left with are EU and A1 

