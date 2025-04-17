/*
SQL Code for Data Clean Up.

Key Notes for cleanup:
1. Table geo_lookup has incorrect/ missing field names
2. Missing data in field REFUND_TS on cleaned version of orders_raw is normal
3. Missing COUNTRY_CODE from orders_raw table can be possibly filled using other tables
4. Missing MARKETING_CHANNEL and ACCOUNT_CREATION_METHOD from orders_raw table can be possibly filled using other tables. This also applies vice versa
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
