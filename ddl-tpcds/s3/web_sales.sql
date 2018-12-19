CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS web_sales;

CREATE TABLE `web_sales`(
  `ws_sold_time_sk` bigint, 
  `ws_ship_date_sk` bigint, 
  `ws_item_sk` bigint, 
  `ws_bill_customer_sk` bigint, 
  `ws_bill_cdemo_sk` bigint, 
  `ws_bill_hdemo_sk` bigint, 
  `ws_bill_addr_sk` bigint, 
  `ws_ship_customer_sk` bigint, 
  `ws_ship_cdemo_sk` bigint, 
  `ws_ship_hdemo_sk` bigint, 
  `ws_ship_addr_sk` bigint, 
  `ws_web_page_sk` bigint, 
  `ws_web_site_sk` bigint, 
  `ws_ship_mode_sk` bigint, 
  `ws_warehouse_sk` bigint, 
  `ws_promo_sk` bigint, 
  `ws_order_number` bigint, 
  `ws_quantity` int, 
  `ws_wholesale_cost` double, 
  `ws_list_price` double, 
  `ws_sales_price` double, 
  `ws_ext_discount_amt` double, 
  `ws_ext_sales_price` double, 
  `ws_ext_wholesale_cost` double, 
  `ws_ext_list_price` double, 
  `ws_ext_tax` double, 
  `ws_coupon_amt` double, 
  `ws_ext_ship_cost` double, 
  `ws_net_paid` double, 
  `ws_net_paid_inc_tax` double, 
  `ws_net_paid_inc_ship` double, 
  `ws_net_paid_inc_ship_tax` double, 
  `ws_net_profit` double)
PARTITIONED BY ( 
  `ws_sold_date_sk` bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/web_sales';
