CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS catalog_page;

CREATE EXTERNAL TABLE `catalog_page`(
  `cp_catalog_page_sk` bigint, 
  `cp_catalog_page_id` string, 
  `cp_start_date_sk` bigint, 
  `cp_end_date_sk` bigint, 
  `cp_department` string, 
  `cp_catalog_number` int, 
  `cp_catalog_page_number` int, 
  `cp_description` string, 
  `cp_type` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/catalog_page';
