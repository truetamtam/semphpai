#!/usr/bin/env bash
docker build -t "data_$1" ./data/
docker run --name $1 data_$1