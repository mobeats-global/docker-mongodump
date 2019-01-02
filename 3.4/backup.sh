#!/bin/bash

set -e

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
filename=$NAME

mkdir -p dump
mongodump -h $MONGO_HOST -p $MONGO_PORT
tar -zcvf /backup/$filename.tar.gz dump/
rm -rf dump/

echo "Job finished: $(date)"
