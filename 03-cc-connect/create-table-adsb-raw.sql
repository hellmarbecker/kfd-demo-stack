CREATE TABLE `adsb-raw` (
  `kafka_timestamp` TIMESTAMP_LTZ(3) METADATA FROM 'timestamp',
  `kafka_headers` MAP<BYTES, BYTES> NOT NULL METADATA FROM 'headers',
  `val` STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'adsb-raw',
  'properties.group.id' = 'kafka-supervisor-flink',
  'scan.startup.mode' = 'earliest-offset',
  'properties.bootstrap.servers' = '<Confluent Cloud bootstrap server>',
  'properties.security.protocol' = 'SASL_SSL',
  'properties.sasl.mechanism' = 'PLAIN',
  'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.plain.PlainLoginModule  required username="<Confluent Cloud API Key>" password="<Confluent Cloud API Secret>";',
  'value.format' = 'raw'
);
