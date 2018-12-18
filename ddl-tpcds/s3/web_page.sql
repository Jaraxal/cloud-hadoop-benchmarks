CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS web_page;

CREATE EXTERNAL TABLE `web_page`(
  `wp_web_page_sk` bigint, 
  `wp_web_page_id` string, 
  `wp_rec_start_date` string, 
  `wp_rec_end_date` string, 
  `wp_creation_date_sk` bigint, 
  `wp_access_date_sk` bigint, 
  `wp_autogen_flag` string, 
  `wp_customer_sk` bigint, 
  `wp_url` string, 
  `wp_type` string, 
  `wp_char_count` int, 
  `wp_link_count` int, 
  `wp_image_count` int, 
  `wp_max_ad_count` int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/web_page';
