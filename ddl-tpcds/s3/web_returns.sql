CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS web_returns;

CREATE TABLE `web_returns`(
  `wr_returned_time_sk` bigint, 
  `wr_item_sk` bigint, 
  `wr_refunded_customer_sk` bigint, 
  `wr_refunded_cdemo_sk` bigint, 
  `wr_refunded_hdemo_sk` bigint, 
  `wr_refunded_addr_sk` bigint, 
  `wr_returning_customer_sk` bigint, 
  `wr_returning_cdemo_sk` bigint, 
  `wr_returning_hdemo_sk` bigint, 
  `wr_returning_addr_sk` bigint, 
  `wr_web_page_sk` bigint, 
  `wr_reason_sk` bigint, 
  `wr_order_number` bigint, 
  `wr_return_quantity` int, 
  `wr_return_amt` double, 
  `wr_return_tax` double, 
  `wr_return_amt_inc_tax` double, 
  `wr_fee` double, 
  `wr_return_ship_cost` double, 
  `wr_refunded_cash` double, 
  `wr_reversed_charge` double, 
  `wr_account_credit` double, 
  `wr_net_loss` double)
PARTITIONED BY ( 
  `wr_returned_date_sk` bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/web_returns';
