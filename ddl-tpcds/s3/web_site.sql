CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS web_site;

CREATE TABLE `web_site`(
  `web_site_sk` bigint, 
  `web_site_id` string, 
  `web_rec_start_date` string, 
  `web_rec_end_date` string, 
  `web_name` string, 
  `web_open_date_sk` bigint, 
  `web_close_date_sk` bigint, 
  `web_class` string, 
  `web_manager` string, 
  `web_mkt_id` int, 
  `web_mkt_class` string, 
  `web_mkt_desc` string, 
  `web_market_manager` string, 
  `web_company_id` int, 
  `web_company_name` string, 
  `web_street_number` string, 
  `web_street_name` string, 
  `web_street_type` string, 
  `web_suite_number` string, 
  `web_city` string, 
  `web_county` string, 
  `web_state` string, 
  `web_zip` string, 
  `web_country` string, 
  `web_gmt_offset` double, 
  `web_tax_percentage` double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/web_site';
