# Filter data


```sql
CREATE TABLE `imply-news-raw` (
  `payload` STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'imply-news',
  'properties.group.id' = 'demoGroup',
  'scan.startup.mode' = 'earliest-offset',
  'properties.bootstrap.servers' = 'kafka:9092',
  'value.format' = 'raw',
  'sink.partitioner' = 'fixed'
);
```
