#! /bin/bash
export INSTANCE=$(($(docker ps | grep adb | wc -l)+1))
export ADB_NAME=adb$INSTANCE
export PROVIDER_NAME=provider$INSTANCE
sed "s/#{ADB_NAME}/${ADB_NAME}/g;s/#{PROVIDER_NAME}/${PROVIDER_NAME}/g" docker-compose-template.yml > docker-compose.yml
docker-compose up -d