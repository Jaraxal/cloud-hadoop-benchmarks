CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS household_demographics;

CREATE EXTERNAL TABLE `household_demographics`(
  `hd_demo_sk` bigint, 
  `hd_income_band_sk` bigint, 
  `hd_buy_potential` string, 
  `hd_dep_count` int, 
  `hd_vehicle_count` int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/household_demographics';
