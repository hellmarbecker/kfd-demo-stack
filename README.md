# kfd-demo-stack

Kafka-Flink-Druid demo stack

## Start and stop

```bash
DRUID_VERSION=26.0.0 docker compose --profile all-services up -d --build
DRUID_VERSION=26.0.0 docker compose --profile all-services down
```

## Connect to Flink SQL

```
docker compose run sql-client
```

## How to check things

- Kafka brokers: listeners
  - at `localhost:9092` from host's point of view
  - at `kafka:9094` from inside docker compose
- Flink console at `localhost:18081`
- Druid console at `localhost:8888`

## Demo script

run all containers and log on to Flink SQL, see above

make a copy of `create-table-adsb-raw.sql` and enter the proper Confluent Cloud credentials

run the copied `create-table-adsb-raw.sql` - this puts a table on the stream with raw value, but reading all the metadata correctly

run `create-table-adsb-json.sql` - this defines the target table

run `insert-adsb-json.sql`- starts the transformation job

go to Druid and set up a supervisor for bootstrap server `kafka:9092`, topic `adsb-json`
