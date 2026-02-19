#!/bin/bash
BACKUP_DIR="./backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR

echo "Backing up PostgreSQL database..."
docker exec orthanc-postgres pg_dump -U orthanc orthanc > $BACKUP_DIR/orthanc_db_$TIMESTAMP.sql

echo "Backing up DICOM storage..."
tar -czf $BACKUP_DIR/orthanc_storage_$TIMESTAMP.tar.gz data/orthanc-storage

echo "Backup completed: $TIMESTAMP"
ls -lh $BACKUP_DIR/*$TIMESTAMP*

# Keep only last 7 days of backups
find $BACKUP_DIR -name "*.sql" -mtime +7 -delete
find $BACKUP_DIR -name "*.tar.gz" -mtime +7 -delete
