#!/bin/bash

set -e

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)

#get NAME from environment or set default as backup
NOMBRE="${NAME:-backup}"

FILE="/backup/$NOMBRE-$DATE.tar.gz"

mkdir -p dump
mongodump -h $MONGO_HOST -p $MONGO_PORT $EXTRA_OPTS
tar -zcvf $FILE dump/

rm -rf dump/

echo "Job finished: $(date)"
