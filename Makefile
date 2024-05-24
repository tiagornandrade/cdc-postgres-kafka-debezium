create-network:
	docker network create enricher_default

up:
	docker compose up -d

down:
	docker compose down

connect-service:
	curl -H "Accept:application/json" localhost:8083/

called-postgresql-connector:
	curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ --data "@debezium.json"

list-connectors:
	curl -H "Accept:application/json" localhost:8083/connectors/

topic:
	docker run --tty --network enricher_default confluentinc/cp-kafkacat:7.1.9 kafkacat -b kafka:9092 -C -t topic_user_profile.public.user_profile