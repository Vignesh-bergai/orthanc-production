#!/bin/bash
echo "Starting Orthanc Production Stack..."
docker-compose up -d

echo "Waiting for services to be healthy..."
sleep 10

docker-compose ps
echo ""
echo "Orthanc is running at:"
echo "Web UI: http://localhost:8042"
echo "Username: orthanc"
echo "Password: orthanc"
echo "DICOM Port: 4242"
