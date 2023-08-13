# Instructions for Demo 01

## create internal table with fake data

```sql
CREATE TABLE `pageviews` (
  `url` STRING,
  `user_id` STRING,
  `browser` STRING,
  `ts` TIMESTAMP(3)
) WITH (
  'connector' = 'faker',
  'rows-per-second' = '10',
  'fields.url.expression' = '/#{GreekPhilosopher.name}.html',
  'fields.user_id.expression' = '#{numerify ''user_##''}',
  'fields.browser.expression' = '#{Options.option ''chrome'', ''firefox'', ''safari'')}',
  'fields.ts.expression' =  '#{date.past ''5'',''1'',''SECONDS''}'
);
```

## create kafka backed table

```sql
CREATE TABLE pageviews_kafka (
  `url` STRING,
  `user_id` STRING,
  `browser` STRING,
  `ts` TIMESTAMP(3)
) WITH (
  'connector' = 'kafka',
  'topic' = 'pageviews',
  'properties.group.id' = 'demoGroup',
  'scan.startup.mode' = 'earliest-offset',
  'properties.bootstrap.servers' = 'kafka:9092',
  'value.format' = 'json',
  'sink.partitioner' = 'fixed'
);
```

this will create the topic because autocreate is on in the local kafka

## push data from the internal table to the kafka table

```sql
INSERT INTO pageviews_kafka SELECT * FROM pageviews;
```

## run `kcat` on the host to verify that data is there

```bash
kcat -b localhost:9094 -L 
kcat -b localhost:9094 -C -t pageviews
```
