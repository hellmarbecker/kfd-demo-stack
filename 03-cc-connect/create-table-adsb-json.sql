CREATE TABLE `adsb-json` (
  `kafka_timestamp`         TIMESTAMP_LTZ(3)           METADATA FROM 'timestamp',
  `kafka_headers`           MAP<BYTES, BYTES> NOT NULL METADATA FROM 'headers',
  `kafka_key`               STRING,
  `message_type`            VARCHAR,
  `transmission_type`       INTEGER,
  `session_id`              INTEGER,
  `aircraft_id`             INTEGER,
  `hex_ident`               VARCHAR,
  `flight_id`               INTEGER,
  `date_message_generated`  VARCHAR,
  `time_message_generated`  VARCHAR,
  `date_message_logged`     VARCHAR,
  `time_message_logged`     VARCHAR,
  `callsign`                VARCHAR,
  `altitude`                INTEGER,
  `ground_speed`            DOUBLE,
  `track`                   DOUBLE,
  `latitude`                DOUBLE,
  `longitude`               DOUBLE,
  `vertical_rate`           INTEGER,
  `squawk`                  VARCHAR,
  `alert`                   INTEGER,
  `emergency`               INTEGER,
  `spi`                     INTEGER,
  `is_on_ground`            INTEGER
) WITH (
  'connector' = 'kafka',
  'topic' = 'adsb-json',
  'scan.startup.mode' = 'earliest-offset',
  'key.format' = 'csv',
  'key.fields' = 'kafka_key', 
  'key.fields-prefix' = 'kafka_', 
  'value.format' = 'json', 
  'value.fields-include' = 'EXCEPT_KEY',
  'properties.bootstrap.servers' = 'kafka:9094'
);




