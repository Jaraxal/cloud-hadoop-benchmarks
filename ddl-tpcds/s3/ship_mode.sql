CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS ship_mode;

CREATE EXTERNAL TABLE `ship_mode`(
  `sm_ship_mode_sk` bigint, 
  `sm_ship_mode_id` string, 
  `sm_type` string, 
  `sm_code` string, 
  `sm_carrier` string, 
  `sm_contract` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/ship_mode';
