/*
 Fields with missing data in Orders_clean to investigate
 PURCHASE_TS                    2
 REFUND_TS                  88231
 USD_PRICE                     28
 CURRENCY                      51
 MARKETING_CHANNEL           1186
 ACCOUNT_CREATION_METHOD     1186
 COUNTRY_CODE                 116
*/

-- Attempt to see if `customers` table can help populate country_code in `orders_clean`
SELECT 
    o.user_id,o.country_code,
    c.country_code AS identified_country_code  -- Add country_code from customers table
FROM 
    `data-analysis-projects-456521.laptronics_data.orders_clean` o
LEFT JOIN 
    `data-analysis-projects-456521.laptronics_data.customers` c
ON 
    o.user_id = c.id  -- Joining on customer_id
WHERE 
    o.country_code IS NULL;  -- Only consider rows where country_code is NULL in orders_clean



-- Attempt to see if `customers` table can help populate marketing_channel or account_creation_method in `orders_clean`
WITH temp AS (
  SELECT 
    a.user_id,a.MARKETING_CHANNEL,
    b.MARKETING_CHANNEL as cMarketingChan 
  FROM 
    `data-analysis-projects-456521.laptronics_data.orders_clean` a
  LEFT JOIN 
    `data-analysis-projects-456521.laptronics_data.customers` c
  ON 
    a.user_id = b.id  
  WHERE 
    a.MARKETING_CHANNEL IS NULL 
)

SELECT 
  COUNT(CASE WHEN marketing_channel IS NULL THEN 1 END) as count_of_ordernull,
  COUNT(CASE WHEN cMarketingChan IS NULL THEN 1 END) as count_of_custnull
FROM temp


WITH temp2 AS (
  SELECT 
    a.user_id,a.account_creation_method,
    b.account_creation_method as cAccCreation
  FROM 
    `data-analysis-projects-456521.laptronics_data.orders_clean` a
  LEFT JOIN 
    `data-analysis-projects-456521.laptronics_data.customers` b
  ON 
    a.user_id = b.id  
  WHERE 
    o.account_creation_method IS NULL 
)

SELECT 
  COUNT(CASE WHEN account_creation_method IS NULL THEN 1 END) as count_of_ordernull,
  COUNT(CASE WHEN cAccCreation IS NULL THEN 1 END) as count_of_custnull
FROM temp2

    
/*
    CURRENCY field research
    Attempt to see if there is any coorolation to populate the data
*/

SELECT * FROM `data-analysis-projects-456521.laptronics_data.orders_clean` 
WHERE CURRENCY IS NULL

SELECT currency, count(currency)
FROM `data-analysis-projects-456521.laptronics_data.orders_clean` 
GROUP BY currency

SELECT count(*)
FROM `data-analysis-projects-456521.laptronics_data.orders_clean` 
WHERE USD_PRICE = 0.0

SELECT usd_price, local_price,currency,country_code
FROM `data-analysis-projects-456521.laptronics_data.orders_clean` 
WHERE USD_PRICE = 0.0
AND CURRENCY IS NOT NULL

/*
    USD_PRICE Field research
*/
SELECT purchase_ts, usd_price, local_price, currency, country_code
FROM `data-analysis-projects-456521.laptronics_data.orders_clean` 
WHERE USD_PRICE IS NULL

    
    
/*
    PURCHASE_TS field research
    Attempt to see if there is any coorolation to populate the data
*/

SELECT 
    a.user_id,
    a.order_id,
    a.PURCHASE_TS,
    b.id,
    b.purchase_ts
FROM 
    `data-analysis-projects-456521.laptronics_data.orders_clean` a
LEFT JOIN 
    `data-analysis-projects-456521.laptronics_data.order_status` b
ON 
    a.ORDER_ID = b.id
WHERE 
    a.PURCHASE_TS IS NULL



