#!/bin/bash

SERVER_ADDR="$1"

rm -rf target && mkdir target
cp -R processes forms _main.json target/

cd target && zip -r payload.zip ./* > /dev/null && cd ..

curl -H "Authorization: auBy4eDWrKWsyhiDp3AQiw" -H "Content-Type: application/octet-stream" --data-binary @target/payload.zip http://${SERVER_ADDR}/api/v1/process
