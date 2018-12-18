CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS call_center;

CREATE EXTERNAL TABLE `call_center`(
  `cc_call_center_sk` bigint, 
  `cc_call_center_id` string, 
  `cc_rec_start_date` string, 
  `cc_rec_end_date` string, 
  `cc_closed_date_sk` bigint, 
  `cc_open_date_sk` bigint, 
  `cc_name` string, 
  `cc_class` string, 
  `cc_employees` int, 
  `cc_sq_ft` int, 
  `cc_hours` string, 
  `cc_manager` string, 
  `cc_mkt_id` int, 
  `cc_mkt_class` string, 
  `cc_mkt_desc` string, 
  `cc_market_manager` string, 
  `cc_division` int, 
  `cc_division_name` string, 
  `cc_company` int, 
  `cc_company_name` string, 
  `cc_street_number` string, 
  `cc_street_name` string, 
  `cc_street_type` string, 
  `cc_suite_number` string, 
  `cc_city` string, 
  `cc_county` string, 
  `cc_state` string, 
  `cc_zip` string, 
  `cc_country` string, 
  `cc_gmt_offset` double, 
  `cc_tax_percentage` double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/call_center';
