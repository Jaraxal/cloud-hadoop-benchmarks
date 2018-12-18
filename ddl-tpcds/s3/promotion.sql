CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS promotion;

CREATE EXTERNAL TABLE `promotion`(
  `p_promo_sk` bigint, 
  `p_promo_id` string, 
  `p_start_date_sk` bigint, 
  `p_end_date_sk` bigint, 
  `p_item_sk` bigint, 
  `p_cost` double, 
  `p_response_target` int, 
  `p_promo_name` string, 
  `p_channel_dmail` string, 
  `p_channel_email` string, 
  `p_channel_catalog` string, 
  `p_channel_tv` string, 
  `p_channel_radio` string, 
  `p_channel_press` string, 
  `p_channel_event` string, 
  `p_channel_demo` string, 
  `p_channel_details` string, 
  `p_purpose` string, 
  `p_discount_active` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/promotion';
