CREATE DATABASE IF NOT EXISTS ${DB};
USE ${DB};

DROP TABLE IF EXISTS inventory;

CREATE EXTERNAL TABLE `inventory`(
  `inv_item_sk` bigint, 
  `inv_warehouse_sk` bigint, 
  `inv_quantity_on_hand` int)
PARTITIONED BY ( 
  `inv_date_sk` bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  '${LOCATION}/${DB}.db/inventory';
