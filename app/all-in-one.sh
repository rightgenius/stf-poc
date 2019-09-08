# nginx

# ALL IN APP
# auth
nohup stf auth-mock --app-url http://${PUBLIC_IP}/ --port 3001 2>&1 > logs/auth.log &
# processor
nohup stf processor --connect-app-dealer tcp://localhost:7160 --connect-dev-dealer tcp://localhost:7260 2>&1 > logs/processor.log &
# triproxy
nohup stf triproxy app --bind-pub "tcp://*:7150" --bind-dealer "tcp://*:7160" --bind-pull "tcp://*:7170" 2>&1 > logs/triproxy.log &
# dev-triproxy
nohup stf triproxy dev --bind-pub "tcp://*:7250" --bind-dealer "tcp://*:7260" --bind-pull "tcp://*:7270" 2>&1 > logs/dev-triproxy.log &
# migrate
# reaper
nohup stf reaper dev --connect-push tcp://localhost:7270 --connect-sub tcp://localhost:7150 --heartbeat-timeout 30000 2>&1 > logs/reaper.log &
# storage-plugin-apk
nohup stf storage-plugin-apk --port 3002 --storage-url http://${PUBLIC_IP}/ 2>&1 > logs/storage-plugin-apk.log &
# storage-plugin-image
nohup stf storage-plugin-image --port 3003 --storage-url http://${PUBLIC_IP}/ 2>&1 > logs/storage-plugin-image.log &
# storage-temp
nohup stf storage-temp --port 3004 --save-dir /app/data 2>&1 > logs/storage-temp.log & 
# websocket
nohup stf websocket --port 3005 --storage-url http://${PUBLIC_IP}/ --connect-sub tcp://localhost:7150 --connect-push tcp://localhost:7170 2>&1 > logs/websocket.log &
# api
nohup stf api --port 3006 --connect-sub tcp://localhost:7150 --connect-push tcp://localhost:7170 2>&1 > logs/api.log &

# app
stf app --auth-url http://${PUBLIC_IP}/auth/mock/ --websocket-url ws://${PUBLIC_IP}/ --port 3000
# rethinkdb

# adb
# provider
