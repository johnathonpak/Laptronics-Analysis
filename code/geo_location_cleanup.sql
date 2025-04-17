/*
SQL Code for Data Clean Up.

Key Notes for cleanup:
1. Table geo_lookup has incorrect/ missing field names
2. Missing data in field REFUND_TS on cleaned version of orders_raw is normal
3. Missing COUNTRY_CODE from orders_raw table can be possibly filled using other tables
4. Missing MARKETING_CHANNEL and ACCOUNT_CREATION_METHOD from orders_raw table can be possibly filled using other tables. This also applies vice versa
*/


/*
GEO LOCATION TABLE CLEANING
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

-- Check all possible region codes
SELECT region, count(region)
FROM data-analysis-projects-456521.laptronics_data.geo_lookup_new
GROUP BY region;

/*
Results:
2	APAC 42
3	EMEA 98
4	LATAM 22
5	NA 24
6	region 1
*/

SELECT country, region
FROM data-analysis-projects-456521.laptronics_data.geo_lookup_new
WHERE region IS NULL;
-- Countries where regions are null are EU and A1 


/* 
  Due to BigQuery Free version, we need to replace previous table with new 
  and clean up the data.
*/

CREATE OR REPLACE TABLE `data-analysis-projects-456521.laptronics_data.geo_lookup_new` AS
SELECT
  country,
  CASE
    WHEN country = 'EU' THEN 'EMEA'  -- Update 'EU' to 'EMEA' in the 'region' column
    ELSE region  -- Keep other region values as they are
  END AS region
FROM `data-analysis-projects-456521.laptronics_data.geo_lookup_new` 
WHERE country != 'A1'   -- Exclude rows where country = 'A1'
  AND region != 'region';  -- Exclude rows where region = 'region'


