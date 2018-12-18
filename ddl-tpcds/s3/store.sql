CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS store;

CREATE EXTERNAL TABLE `store`(
  `s_store_sk` bigint, 
  `s_store_id` string, 
  `s_rec_start_date` string, 
  `s_rec_end_date` string, 
  `s_closed_date_sk` bigint, 
  `s_store_name` string, 
  `s_number_employees` int, 
  `s_floor_space` int, 
  `s_hours` string, 
  `s_manager` string, 
  `s_market_id` int, 
  `s_geography_class` string, 
  `s_market_desc` string, 
  `s_market_manager` string, 
  `s_division_id` int, 
  `s_division_name` string, 
  `s_company_id` int, 
  `s_company_name` string, 
  `s_street_number` string, 
  `s_street_name` string, 
  `s_street_type` string, 
  `s_suite_number` string, 
  `s_city` string, 
  `s_county` string, 
  `s_state` string, 
  `s_zip` string, 
  `s_country` string, 
  `s_gmt_offset` double, 
  `s_tax_precentage` double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/store';
