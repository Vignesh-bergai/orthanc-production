#!/bin/bash
echo "=== Docker Status ==="
docker-compose ps

echo ""
echo "=== PostgreSQL Stats ==="
docker exec orthanc-postgres psql -U orthanc -d orthanc -c "SELECT COUNT(*) as total_resources FROM Resources;"
docker exec orthanc-postgres psql -U orthanc -d orthanc -c "SELECT pg_size_pretty(pg_database_size('orthanc')) as db_size;"

echo ""
echo "=== Orthanc API Status ==="
curl -s -u orthanc:orthanc http://localhost:8042/system | jq '.'
