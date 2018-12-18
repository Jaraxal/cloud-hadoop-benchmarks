CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS catalog_returns;

CREATE EXTERNAL TABLE `catalog_returns`(
  `cr_returned_time_sk` bigint, 
  `cr_item_sk` bigint, 
  `cr_refunded_customer_sk` bigint, 
  `cr_refunded_cdemo_sk` bigint, 
  `cr_refunded_hdemo_sk` bigint, 
  `cr_refunded_addr_sk` bigint, 
  `cr_returning_customer_sk` bigint, 
  `cr_returning_cdemo_sk` bigint, 
  `cr_returning_hdemo_sk` bigint, 
  `cr_returning_addr_sk` bigint, 
  `cr_call_center_sk` bigint, 
  `cr_catalog_page_sk` bigint, 
  `cr_ship_mode_sk` bigint, 
  `cr_warehouse_sk` bigint, 
  `cr_reason_sk` bigint, 
  `cr_order_number` bigint, 
  `cr_return_quantity` int, 
  `cr_return_amount` double, 
  `cr_return_tax` double, 
  `cr_return_amt_inc_tax` double, 
  `cr_fee` double, 
  `cr_return_ship_cost` double, 
  `cr_refunded_cash` double, 
  `cr_reversed_charge` double, 
  `cr_store_credit` double, 
  `cr_net_loss` double)
PARTITIONED BY ( 
  `cr_returned_date_sk` bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/catalog_returns';
