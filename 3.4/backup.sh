#!/bin/bash

set -e

echo "Job started: $(date)"
OPCIONES=$EXTRA_OPTS
NOMBRE=$NAME
DATE=$(date +%Y%m%d_%H%M%S)
FILE="/backup/$NOMBRE-$DATE.tar.gz"

mkdir -p dump
mongodump -h $MONGO_HOST -p $MONGO_PORT $OPCIONES
tar -zcvf $FILE dump/

rm -rf dump/

echo "Job finished: $(date)"
