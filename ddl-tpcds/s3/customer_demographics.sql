CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS customer_demographics;

CREATE EXTERNAL TABLE `customer_demographics`(
  `cd_demo_sk` bigint, 
  `cd_gender` string, 
  `cd_marital_status` string, 
  `cd_education_status` string, 
  `cd_purchase_estimate` int, 
  `cd_credit_rating` string, 
  `cd_dep_count` int, 
  `cd_dep_employed_count` int, 
  `cd_dep_college_count` int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/customer_demographics';
