CREATE TABLE `adsb-json` (
  `kafka_timestamp`         TIMESTAMP_LTZ(3)           METADATA FROM 'timestamp',
  `kafka_headers`           MAP<BYTES, BYTES> NOT NULL METADATA FROM 'headers',
  `kafka_key`               STRING,
  `event_timestamp`         STRING,
  `message_type`            STRING,
  `transmission_type`       STRING,
  `session_id`              STRING,
  `aircraft_id`             STRING,
  `hex_ident`               STRING,
  `flight_id`               STRING,
  `date_message_generated`  STRING,
  `time_message_generated`  STRING,
  `date_message_logged`     STRING,
  `time_message_logged`     STRING,
  `callsign`                STRING,
  `altitude`                STRING,
  `ground_speed`            STRING,
  `track`                   STRING,
  `latitude`                STRING,
  `longitude`               STRING,
  `vertical_rate`           STRING,
  `squawk`                  STRING,
  `alert`                   STRING,
  `emergency`               STRING,
  `spi`                     STRING,
  `is_on_ground`            STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'adsb-json',
  'scan.startup.mode' = 'earliest-offset',
  'key.format' = 'csv',
  'key.fields' = 'kafka_key', 
  'key.fields-prefix' = 'kafka_', 
  'value.format' = 'json', 
  'value.fields-include' = 'EXCEPT_KEY',
  'properties.bootstrap.servers' = 'kafka:9094',
  'sink.partitioner' = 'fixed'
);




