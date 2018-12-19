CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS catalog_sales;

CREATE EXTERNAL TABLE `catalog_sales`(
  `cs_sold_time_sk` bigint, 
  `cs_ship_date_sk` bigint, 
  `cs_bill_customer_sk` bigint, 
  `cs_bill_cdemo_sk` bigint, 
  `cs_bill_hdemo_sk` bigint, 
  `cs_bill_addr_sk` bigint, 
  `cs_ship_customer_sk` bigint, 
  `cs_ship_cdemo_sk` bigint, 
  `cs_ship_hdemo_sk` bigint, 
  `cs_ship_addr_sk` bigint, 
  `cs_call_center_sk` bigint, 
  `cs_catalog_page_sk` bigint, 
  `cs_ship_mode_sk` bigint, 
  `cs_warehouse_sk` bigint, 
  `cs_item_sk` bigint, 
  `cs_promo_sk` bigint, 
  `cs_order_number` bigint, 
  `cs_quantity` int, 
  `cs_wholesale_cost` double, 
  `cs_list_price` double, 
  `cs_sales_price` double, 
  `cs_ext_discount_amt` double, 
  `cs_ext_sales_price` double, 
  `cs_ext_wholesale_cost` double, 
  `cs_ext_list_price` double, 
  `cs_ext_tax` double, 
  `cs_coupon_amt` double, 
  `cs_ext_ship_cost` double, 
  `cs_net_paid` double, 
  `cs_net_paid_inc_tax` double, 
  `cs_net_paid_inc_ship` double, 
  `cs_net_paid_inc_ship_tax` double, 
  `cs_net_profit` double)
PARTITIONED BY ( 
  `cs_sold_date_sk` bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/catalog_sales';