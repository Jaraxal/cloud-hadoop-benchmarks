CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS store_returns;

CREATE EXTERNAL TABLE `store_returns`(
  `sr_return_time_sk` bigint, 
  `sr_item_sk` bigint, 
  `sr_customer_sk` bigint, 
  `sr_cdemo_sk` bigint, 
  `sr_hdemo_sk` bigint, 
  `sr_addr_sk` bigint, 
  `sr_store_sk` bigint, 
  `sr_reason_sk` bigint, 
  `sr_ticket_number` bigint, 
  `sr_return_quantity` int, 
  `sr_return_amt` double, 
  `sr_return_tax` double, 
  `sr_return_amt_inc_tax` double, 
  `sr_fee` double, 
  `sr_return_ship_cost` double, 
  `sr_refunded_cash` double, 
  `sr_reversed_charge` double, 
  `sr_store_credit` double, 
  `sr_net_loss` double)
PARTITIONED BY ( 
  `sr_returned_date_sk` bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/store_returns';
