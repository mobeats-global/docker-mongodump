#!/bin/bash

set -e

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)

if [ -v $NAME ]
then
    NOMBRE=$NAME
else
    NOMBRE="backup"

FILE="/backup/$NOMBRE-$DATE.tar.gz"

mkdir -p dump
mongodump -h $MONGO_HOST -p $MONGO_PORT $EXTRA_OPTS
tar -zcvf $FILE dump/

rm -rf dump/

echo "Job finished: $(date)"
