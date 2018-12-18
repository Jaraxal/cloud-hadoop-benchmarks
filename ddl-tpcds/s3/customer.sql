CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS customer;

CREATE EXTERNAL TABLE `customer`(
  `c_customer_sk` bigint, 
  `c_customer_id` string, 
  `c_current_cdemo_sk` bigint, 
  `c_current_hdemo_sk` bigint, 
  `c_current_addr_sk` bigint, 
  `c_first_shipto_date_sk` bigint, 
  `c_first_sales_date_sk` bigint, 
  `c_salutation` string, 
  `c_first_name` string, 
  `c_last_name` string, 
  `c_preferred_cust_flag` string, 
  `c_birth_day` int, 
  `c_birth_month` int, 
  `c_birth_year` int, 
  `c_birth_country` string, 
  `c_login` string, 
  `c_email_address` string, 
  `c_last_review_date` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/customer';
