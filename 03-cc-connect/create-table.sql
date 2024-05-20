CREATE TABLE `adsb-raw` (
  `kafka_timestamp` TIMESTAMP_LTZ(3) METADATA FROM 'timestamp',
  `kafka_headers` MAP NOT NULL METADATA FROM 'headers',
  `MT` STRING
) WITH (
  'connector' = 'kafka',
  'topic' = 'adsb-raw',
  'properties.group.id' = 'kafka-supervisor-flink',
  'scan.startup.mode' = 'earliest-offset',
  'properties.bootstrap.servers' = '<Confluent Cloud bootstrap server>',
  'properties.security.protocol' = 'SASL_SSL',
  'properties.sasl.mechanism' = 'PLAIN',
  'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.plain.PlainLoginModule  required username="<Confluent Cloud API Key>" password="<Confluent Cloud API Secret>";',
  'value.fields' = 'MT;TT;SID;AID;Hex;FID;DMG;TMG;DML;TML;CS;Alt;GS;Trk;Lat;Lng;VR;Sq;Alrt;Emer;SPI;Gnd',  
  'value.format' = 'csv'
);
