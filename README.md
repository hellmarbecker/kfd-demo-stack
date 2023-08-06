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
