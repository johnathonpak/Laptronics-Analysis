/*
Fields with missing data in Orders_raw to investigate
PURCHASE_TS                    2
REFUND_TS                  88231
USD_PRICE                     28
CURRENCY                      51
MARKETING_CHANNEL           1186
ACCOUNT_CREATION_METHOD     1186
COUNTRY_CODE                 116
*/

-- Attempt to see if `customers` table can help populate country_code in `orders_raw`
SELECT 
    o.user_id,o.country_code,
    c.country_code AS identified_country_code  -- Add country_code from customers table
FROM 
    `data-analysis-projects-456521.laptronics_data.orders_raw` o
LEFT JOIN 
    `data-analysis-projects-456521.laptronics_data.customers` c
ON 
    o.user_id = c.id  -- Joining on customer_id
WHERE 
    o.country_code IS NULL;  -- Only consider rows where country_code is NULL in orders_raw



-- Attempt to see if `customers` table can help populate marketing_channel or account_creation_method in `orders_raw`
WITH temp AS (
  SELECT 
    o.user_id,o.MARKETING_CHANNEL,
    c.MARKETING_CHANNEL as cMarketingChan 
  FROM 
    `data-analysis-projects-456521.laptronics_data.orders_raw` o
  LEFT JOIN 
    `data-analysis-projects-456521.laptronics_data.customers` c
  ON 
    o.user_id = c.id  
  WHERE 
    o.MARKETING_CHANNEL IS NULL 
)

SELECT 
  COUNT(CASE WHEN marketing_channel IS NULL THEN 1 END) as count_of_ordernull,
  COUNT(CASE WHEN cMarketingChan IS NULL THEN 1 END) as count_of_custnull
FROM temp


WITH temp2 AS (
  SELECT 
    o.user_id,o.account_creation_method,
    c.account_creation_method as cAccCreation
  FROM 
    `data-analysis-projects-456521.laptronics_data.orders_raw` o
  LEFT JOIN 
    `data-analysis-projects-456521.laptronics_data.customers` c
  ON 
    o.user_id = c.id  
  WHERE 
    o.account_creation_method IS NULL 
)

SELECT 
  COUNT(CASE WHEN account_creation_method IS NULL THEN 1 END) as count_of_ordernull,
  COUNT(CASE WHEN cAccCreation IS NULL THEN 1 END) as count_of_custnull
FROM temp2
