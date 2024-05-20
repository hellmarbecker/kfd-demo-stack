INSERT INTO `adsb-json`
SELECT
    `kafka_timestamp`,
    `kafka_headers`,
    `kafka_key`,
    split_index(`val`, ',',  6) || ' ' || split_index(`val`, ',',  7) as `event_timestamp`,
    split_index(`val`, ',',  0) as message_type,
    split_index(`val`, ',',  1) as transmission_type,
    split_index(`val`, ',',  2) as session_id,
    split_index(`val`, ',',  3) as aircraft_id,
    split_index(`val`, ',',  4) as hex_ident,
    split_index(`val`, ',',  5) as flight_id,
    split_index(`val`, ',',  6) as date_message_generated,
    split_index(`val`, ',',  7) as time_message_generated,
    split_index(`val`, ',',  8) as date_message_logged,
    split_index(`val`, ',',  9) as time_message_logged,
    split_index(`val`, ',', 10) as callsign,
    split_index(`val`, ',', 11) as altitude,
    split_index(`val`, ',', 12) as ground_speed,
    split_index(`val`, ',', 13) as track,
    split_index(`val`, ',', 14) as latitude,
    split_index(`val`, ',', 15) as longitude,
    split_index(`val`, ',', 16) as vertical_rate,
    split_index(`val`, ',', 17) as squawk,
    split_index(`val`, ',', 18) as alert,
    split_index(`val`, ',', 19) as emergency,
    split_index(`val`, ',', 20) as spi,
    split_index(`val`, ',', 21) as is_on_ground
FROM `adsb-raw`;
    