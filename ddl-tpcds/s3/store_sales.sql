CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS store_sales;

CREATE EXTERNAL TABLE `store_sales`(
  `ss_sold_time_sk` bigint, 
  `ss_item_sk` bigint, 
  `ss_customer_sk` bigint, 
  `ss_cdemo_sk` bigint, 
  `ss_hdemo_sk` bigint, 
  `ss_addr_sk` bigint, 
  `ss_store_sk` bigint, 
  `ss_promo_sk` bigint, 
  `ss_ticket_number` bigint, 
  `ss_quantity` int, 
  `ss_wholesale_cost` double, 
  `ss_list_price` double, 
  `ss_sales_price` double, 
  `ss_ext_discount_amt` double, 
  `ss_ext_sales_price` double, 
  `ss_ext_wholesale_cost` double, 
  `ss_ext_list_price` double, 
  `ss_ext_tax` double, 
  `ss_coupon_amt` double, 
  `ss_net_paid` double, 
  `ss_net_paid_inc_tax` double, 
  `ss_net_profit` double)
PARTITIONED BY ( 
  `ss_sold_date_sk` bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/store_sales';
