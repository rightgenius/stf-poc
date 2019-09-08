#! /bin/bash
export INSTANCE=$(docker ps | grep adb | wc -l)
export ADB_NAME=adb$INSTANCE
export PROVIDER_NAME=provider$INSTANCE
echo "stop $PROVIDER_NAME and $ADB_NAME"
sed "s/#{ADB_NAME}/${ADB_NAME}/g;s/#{PROVIDER_NAME}/${PROVIDER_NAME}/g" docker-compose-template.yml > docker-compose.yml
docker-compose down